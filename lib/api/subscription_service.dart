import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_300/api/common.dart';
import 'package:go_300/models/Ride.dart';

class SubscriptionService extends CommonService {
  Future<List<Ride>> getSubscriptions() async {
    return [Ride('00','00')];
  }
  Future<List<Ride>> toggleSubscription(TimeOfDay time) async {
    //TODO
  }
}