import 'package:flutter/material.dart';
import 'package:go_300/api/auth.dart';
import 'package:go_300/screens/subscription_page/SubscriptionPage.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
            child: Text("Go 300",
                style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Начните ездить с комфортом, разделяя цену между своими одногрупниками.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0)),
          ),
          TextField(
            controller: usernameController,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                hintText: "Username",
                border: InputBorder.none),
            keyboardType: TextInputType.text,
          ),
          RaisedButton(
            child: Text("Начать экономить"),
            onPressed: () => signInClick(context),
          ),
        ],
      ),
    );
  }

  signInClick(context) {
    AuthService().register(usernameController.text).then((data) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SubscriptionPage(),
        ),
      );
    }).catchError((error) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    });
  }
}
