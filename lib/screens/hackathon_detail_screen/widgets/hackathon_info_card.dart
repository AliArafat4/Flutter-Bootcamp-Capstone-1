import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info.dart';

class HackathonInfoCard extends StatelessWidget {
  const HackathonInfoCard(
      {super.key,
      required this.location,
      required this.startDate,
      required this.endDate,
      required this.teamSize});

  final String? location;
  final String? startDate;
  final String? endDate;
  final String? teamSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HackathonInfo(
          icon: Icons.location_on_outlined,
          title: "$location",
        ),
        HackathonInfo(
          icon: Icons.calendar_month_outlined,
          title: "$startDate - $endDate",
        ),
        HackathonInfo(
          icon: Icons.people_outline,
          title: "$teamSize",
        ),
      ],
    );
  }
}
