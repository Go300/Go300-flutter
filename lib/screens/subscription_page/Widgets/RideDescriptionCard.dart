import 'package:flutter/material.dart';
import 'package:go_300/models/Ride.dart';

class RideDescriptionCard extends StatelessWidget {
  final Ride ride;

  RideDescriptionCard(this.ride);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          child: Card(
            child: InkWell(
              onTap: () => {},
              child: Center(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${ride.from}", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
                    Icon(Icons.arrow_right, size: 32.0),
                    Text("${ride.to}", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
            ),
          ),
        ),
    );
  }

}