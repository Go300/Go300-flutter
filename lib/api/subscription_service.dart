import 'dart:async';
import 'dart:convert';

import 'package:go_300/api/auth_service.dart';
import 'package:go_300/api/common.dart';
import 'package:go_300/models/Ride.dart';
import 'package:go_300/models/Subscription.dart';
import 'package:go_300/screens/subscription_page/Widgets/SubscriptionCard.dart';
import 'package:http/http.dart' as http;

class SubscriptionService extends CommonService {
  Future<List<Ride>> getSubscriptions() async {
    return [Ride('00', '00')];
    //TODO
  }

  Future<Subscription> toggleSubscription(SubscriptionCard card) async {
    var member = '';
    authService.getMemberLocal().then((data) {
      member = data.token;
    });
    final response = await http.post(baseURL + "/api/subscriptions/", headers: {
      'content-type': 'application/json'
    }, body: {
      'member': member,
      'departure': card.ride.from,
      'destination': card.ride.to,
      'when': card.time.toString()
    });
    if (response.statusCode == 201) {
      return Subscription.fromJson(json.decode(response.body)[0]);
    } else {
      throw Exception('Failed to load post');
    }
  }

//  final response = await http
//      .post(Uri.http("10.0.2.2:3000", "/api"), body: {"username": username});

}