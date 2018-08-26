import 'dart:async';
import 'dart:convert';

import 'package:go_300/api/common.dart';
import 'package:go_300/models/Member.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends CommonService {
  Future<Member> register(String username) async {
    final response = await http.get(baseURL + "/api/member");

    if (response.statusCode == 200) {
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