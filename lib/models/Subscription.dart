import 'package:flutter/material.dart';
import 'package:go_300/models/Ride.dart';

class Subscription {
  Ride ride;
  TimeOfDay time;

  Subscription(this.ride, this.time);

  Subscription.fromJson(Map<String, dynamic> json)
      : ride = new Ride(json['departure'], json['destination']),
        time = json["when"];
}