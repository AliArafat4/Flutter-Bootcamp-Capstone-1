import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TeamCard(
                  firstMemberName: "dd",
                  secondMemberName: "dd",
                  thirdMemberName: "dd",
                  fourMemberName: "dd",
                  firstMemberRole: "dd",
                  secondMemberRole: "dd",
                  thirdMemberRole: "dd",
                  fourMemberRole: "dd",
                  teamName: "Ahmad team's")
            ],
          ),
        ),
      ),
    );
  }
}
