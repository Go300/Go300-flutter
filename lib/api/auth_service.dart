library AuthService;

import 'dart:async';
import 'dart:convert';

import 'package:go_300/api/common.dart';
import 'package:go_300/api/push_notifications.dart';
import 'package:go_300/models/AppConstants.dart';
import 'package:go_300/models/Member.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final AuthService authService = AuthService._private();

class AuthService extends CommonService {
  AuthService._private();

  Future<Member> register(String username) async {
    if (DEV_MODE) {
      return Member(username: "NurlashKO", token: "test");
    }
    var data = {
      "username": username,
      "push_token": pushNotificationsService.getToken(),
    };

    final response = await http.post(baseURL + "/api/member", body: data);
    if (response.statusCode == 201) {
      Member member = Member.fromJson(json.decode(response.body));
      saveMemberLocal(member);
      return member;
    } else {
      throw Exception('Failed to load post');
    }
  }

  void saveMemberLocal(Member member) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", member.username);
    prefs.setString("token", member.token);
  }

  Future<Member> getMemberLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Member(
      username: prefs.getString("username"),
      token: prefs.getString("token"),
    );
  }
}
