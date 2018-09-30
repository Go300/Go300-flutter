import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_300/api/auth_service.dart';
import 'package:go_300/api/common.dart';
import 'package:go_300/models/Ride.dart';
import 'package:go_300/models/Subscription.dart';
import 'package:go_300/screens/subscription_page/Widgets/SubscriptionCard.dart';
import 'package:http/http.dart' as http;

final SubscriptionService subscriptionService = SubscriptionService._private();

class SubscriptionService extends CommonService {
  SubscriptionService._private();

  Future<List<Ride>> getSubscriptions() async {
    return [Ride('00', '00')];
    //TODO
  }

  Future<Subscription> toggleSubscription(Ride ride, TimeOfDay time) async {
    var member = '';
    await authService.getMemberLocal().then((data) {
      member = data.token;
    });
    final response = await http.post(baseURL + "/api/subscriptions/", body: {
      'member': member,
      'departure': ride.apiFrom(),
      'destination': ride.apiTo(),
      'when': "${time.hour}:00"
    });
    if (response.statusCode == 201) {
//      return Subscription.fromJson(json.decode(response.body)[0]);
        print("Subscribed");
    } else {
      throw Exception('Failed to toggle subscription');
    }
  }
  
  void addSubscription(Ride ride, TimeOfDay time) {
    final now = new DateTime.now();
    final subscription = Subscription(ride, DateTime(now.year, now.month, now.day, time.hour, time.minute));
  }

  String getStatus(Ride ride, TimeOfDay time) {
    
  }
//  final response = await http
//      .post(Uri.http("10.0.2.2:3000", "/api"), body: {"username": username});

}