import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_300/api/common.dart';
import 'package:go_300/models/Ride.dart';
import 'package:http/http.dart' as http;

class SubscriptionService extends CommonService {

  Future<List<Ride>> getSubscriptions() async {
    return [Ride('00','00')];
    //TODO
  }

  Future<List<Ride>> toggleSubscription(TimeOfDay time) async {
    //TODO
  }

//  final response = await http
//      .post(Uri.http("10.0.2.2:3000", "/api"), body: {"username": username});

}
