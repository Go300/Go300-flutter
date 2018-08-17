import 'package:flutter/material.dart';
import 'package:go_300/models/Ride.dart';

class SubscriptionCard extends StatefulWidget {
  final Ride ride;
  final DateTime time;

  SubscriptionCard(this.ride, this.time);

  @override
  State<StatefulWidget> createState() => _SubscriptionCardState();
}


class _SubscriptionCardState extends State<SubscriptionCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.time.hour.toString)

        ],
      )
    );
  }

}
