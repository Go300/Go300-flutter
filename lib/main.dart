import 'package:flutter/material.dart';
import 'package:go_300/api/auth.dart';
import 'package:go_300/api/push_notifications.dart';
import 'package:go_300/models/AppConstants.dart';
import 'package:go_300/screens/login_page/login_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    pushNotificationsService.init();
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
      home: LoginPage(),
    );
  }
}
