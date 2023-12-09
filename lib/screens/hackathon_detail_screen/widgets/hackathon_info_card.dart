import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info.dart';

class HackathonInfoCard extends StatelessWidget {
  const HackathonInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HackathonInfo(
          icon: Icons.location_on_outlined,
          title: "Online",
        ),
        HackathonInfo(
          icon: Icons.calendar_month_outlined,
          title: "7 December 2023",
        ),
        HackathonInfo(
          icon: Icons.people_outline,
          title: "2-5",
        ),
      ],
    );
  }
}
