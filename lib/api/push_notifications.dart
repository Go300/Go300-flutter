import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_udid/flutter_udid.dart';

final PushNotificationsService pushNotificationsService = PushNotificationsService._private();

class PushNotificationsService {
    PushNotificationsService._private();

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String _token;

    void init() {
        FlutterUdid.consistentUdid.then((String uuid) {
          print(uuid);
        });
        _firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
                print("onMessage: $message");
            },
            onLaunch: (Map<String, dynamic> message) async {
                print("onLaunch: $message");
            },
            onResume: (Map<String, dynamic> message) async {
                print("onResume: $message");
            },
        );
        _firebaseMessaging.getToken().then((String token) {
          _token = token;
          print(token);
        });
    }

    String getToken() {
      return _token;
    }
}