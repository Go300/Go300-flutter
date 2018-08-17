import 'package:flutter/material.dart';
import 'package:go_300/models/AppConstants.dart';
import 'package:go_300/screens/landing_page/landing_page.dart';
import 'package:go_300/screens/login_page/login_page.dart';
import 'package:go_300/screens/subscription_page/SubscriptionPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
