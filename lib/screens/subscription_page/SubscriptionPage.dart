import 'package:flutter/material.dart';
import 'package:go_300/models/AppConstants.dart';
import 'package:go_300/models/Ride.dart';
import 'package:go_300/screens/subscription_page/Widgets/TimedListWidget.dart';
import 'package:go_300/screens/user_rides/UserRidesPage.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(APP_NAME),
            bottom: TabBar(
                tabs: <Tab>[
                  _buildTab(KBTU, SPORT),
                  _buildTab(KBTU, DORMITORY),
                  _buildTab(SPORT, DORMITORY),
                ]
            )
        ),
        body: TabBarView(
          children: [
            TimedListWidget(Ride(KBTU, SPORT)),
            TimedListWidget(Ride(KBTU, DORMITORY)),
            TimedListWidget(Ride(SPORT, DORMITORY)),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 8.0,
          icon: const Icon(Icons.airport_shuttle),
          label: const Text('Мои поездки'),
          onPressed: () => _navigateToUserRides(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 10.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.clear_all),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {},
              )
            ],
          ),
        )
      ),
    );
  }

  Tab _buildTab(leftString, rightString) {
    return Tab(child: Center(
      child: Row(children: <Widget>[
          Text(leftString, ),
          Icon(Icons.swap_horiz, size: 18.0),
          Text(rightString),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ));
  }

  _navigateToUserRides(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserRidesPage(),
      ),
    );
  }
}
