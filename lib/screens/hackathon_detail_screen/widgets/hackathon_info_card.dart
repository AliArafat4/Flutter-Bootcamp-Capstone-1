import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info.dart';

class HackathonInfoCard extends StatelessWidget {
  const HackathonInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff95beff).withOpacity(0.2),
      ),
      width: MediaQuery.of(context).size.width,
      height: 164,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            HackathonInfo(
              icon: Icons.location_on,
              title: "Online",
            ),
            HackathonInfo(
              icon: Icons.calendar_month,
              title: "7 December 2023",
            ),
            HackathonInfo(
              icon: Icons.people,
              title: "2-5",
            ),
          ],
        ),
      ),
    );
  }
}
