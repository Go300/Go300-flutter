import 'package:flutter/material.dart';
import 'package:go_300/api/push_notifications.dart';
import 'package:go_300/models/AppConstants.dart';
import 'package:go_300/screens/login_page/login_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

//void main() {
//  HttpOverrides.global = StethoHttpOverrides();
//  runApp(MyApp());
//}

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
        home: SplashScreen(
            seconds: 3,
            navigateAfterSeconds: new LoginPage(),
            image: new Image.asset('assets/splash.png'),
            title: new Text(''),
            backgroundColor: Color.fromRGBO(33, 33, 33, 1.0),
            photoSize: 200.0,
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Colors.white));
  }
}
