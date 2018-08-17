import 'package:flutter/material.dart';
import 'package:go_300/models/Ride.dart';
import 'package:go_300/screens/subscription_page/Widgets/RideDescriptionCard.dart';

class TimedListWidget extends StatelessWidget {

  final Ride ride;

  TimedListWidget(this.ride);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, int) {
        return RideDescriptionCard(ride);
      }
    );
  }
}