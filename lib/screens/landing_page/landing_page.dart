import 'package:flutter/material.dart';
import 'package:go_300/models/AppConstants.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(APP_NAME, style: new TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
          ],
        ),
      )
    );
  }

}