import 'package:flutter/material.dart';
import 'package:team_hack/screens/notification_screen/widget/notification_card.dart';

class NotificationScrren extends StatelessWidget {
  const NotificationScrren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_sharp),
        title: const Text("Notification"),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              NotificationCard(
                notificationTitle: "You have a new request to join your team",
                isRequestNotification: true,
              ),
              NotificationCard(
                notificationTitle: "Your join request status has been updated",
                isRequestNotification: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
