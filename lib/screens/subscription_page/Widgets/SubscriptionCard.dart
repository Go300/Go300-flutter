import 'package:flutter/material.dart';
import 'package:go_300/models/Ride.dart';

class SubscriptionCard extends StatefulWidget {
  final Ride ride;
  final TimeOfDay time;

  SubscriptionCard(this.ride, this.time);

  SubscriptionCard.fromJson(Map<String, dynamic> json)
      : ride = new Ride(json['departure'], json['destination']),
        time = json["when"];

  @override
  State<StatefulWidget> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
          child: InkWell(
//          onTap: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${widget.time.toString().substring(10, 15)}",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  border: const Border(
                      left: const BorderSide(
                          width: 1.5, color: const Color(0xCCCCCCCCCC))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text("Status",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                          )),
                      Text("Neverending Nightmare",
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                          )),
                      Column(
                        children: <Widget>[
                          Text("0", style: TextStyle(fontSize: 24.0)),
                          Text("Попудчиков")
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
