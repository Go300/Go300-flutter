import 'package:flutter/material.dart';
import 'package:go_300/api/subscription.dart';
import 'package:go_300/models/Ride.dart';
import 'package:go_300/screens/subscription_page/Widgets/RideDescriptionCard.dart';
import 'package:go_300/screens/subscription_page/Widgets/SubscriptionCard.dart';

class TimedListWidget extends StatelessWidget {
  final Ride ride;

  TimedListWidget(this.ride);

  @override
  Widget build(BuildContext context) {
    List<SubscriptionCard> subscriptionList = _buildSubscriptionList();
    return ListView.builder(
        itemCount: 1 + subscriptionList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return RideDescriptionCard(ride);
          } else {
            return GestureDetector(
              child: subscriptionList[index - 1],
              onTap: () {
                SubscriptionService()
                    .toggleSubscription(subscriptionList[index - 1].time);
              },
            );
          }
        });
  }

  List<SubscriptionCard> _buildSubscriptionList() {
    List<SubscriptionCard> subscriptionList = [];
    for (int i = 0; i < 24; i++) {
      subscriptionList
          .add(SubscriptionCard(ride, TimeOfDay(hour: i, minute: 0)));
    }
    return subscriptionList;
  }
}
