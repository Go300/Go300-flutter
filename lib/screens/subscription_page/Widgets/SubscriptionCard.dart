import 'package:flutter/material.dart';
import 'package:go_300/api/subscription_service.dart';
import 'package:go_300/models/Ride.dart';

class SubscriptionCard extends StatefulWidget {
  final Ride ride;
  final TimeOfDay time;

  SubscriptionCard(this.ride, this.time);

  @override
  State<StatefulWidget> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
          child: InkWell(
            onTap: () => subscriptionService.toggleSubscription(widget.ride, widget.time),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  timeLabel(),
                  currentStatus(),
                ]),
                subscriberCount(),
              ],
            ),
          )),
    );
  }

  Widget timeLabel() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: const Border(
            right: const BorderSide(
                width: 0.2, color: const Color(0xCCCCCCCCCC))),
      ),
      child: Text(
        "${widget.time.toString().substring(10, 15)}",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget currentStatus() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
      child: Text("Status",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          )),
    );
  }

  Widget subscriberCount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
      child: Column(
        children: <Widget>[
          Text("0", style: TextStyle(fontSize: 24.0)),
          Text("Попутчиков")
        ],
      ),
    );
  }
}