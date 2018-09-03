library AuthService;

import 'dart:async';
import 'dart:convert';

import 'package:go_300/api/common.dart';
import 'package:go_300/api/push_notifications.dart';
import 'package:go_300/models/Member.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final AuthService authService = AuthService._private();

class AuthService extends CommonService {
  AuthService._private();

  Future<Member> register(String username) async {
//    return Member(username: "NurlashKO", token: "test");
    // final response = await http.get(_baseURL + "/api/member");
    final response = await http
        .post(Uri.http("10.0.2.2:3000", "/api"), body: {
          "username": username,
          "push_token": pushNotificationsService.getToken(),
        });

    if (response.statusCode == 201) {
      Member member = Member.fromJson(json.decode(response.body));
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
