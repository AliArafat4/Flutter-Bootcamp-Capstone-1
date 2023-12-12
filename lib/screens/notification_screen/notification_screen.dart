import 'package:flutter/material.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/screens/notification_screen/widget/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        leading: const SizedBox(),
        leadingWidth: 0,
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
