import 'package:flutter/material.dart';
import 'package:team_hack/models/team_model.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key, required this.teamModelList});

  final List<TeamModel>? teamModelList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: teamModelList != null
              ? Column(
                  children: [
                    ...teamModelList!
                        .map((e) => TeamCard(teamModel: e))
                        .toList()
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
