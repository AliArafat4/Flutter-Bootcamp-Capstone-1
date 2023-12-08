import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.notificationTitle,
      required this.isRequestNotification});
  final String notificationTitle;
  final bool isRequestNotification;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff95beff).withOpacity(0.2),
        ),
        width: MediaQuery.of(context).size.width,
        height: isRequestNotification
            ? MediaQuery.of(context).size.height / 6
            : MediaQuery.of(context).size.height / 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 16),
              child: Text(notificationTitle),
            ),
            const SizedBox(
              height: 22,
            ),
            isRequestNotification
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        textColor: Colors.white,
                        color: const Color(0xff64a3fa),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 18,
                        title: "Accepte",
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SecondButton(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 18,
                          title: "Reject",
                          onPressed: () {},
                          textColor: Colors.red,
                          borderColor: Colors.red),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
