import 'package:flutter/material.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/screens/create_team/create_team_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_main_detail.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info_card.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';
import 'package:team_hack/screens/team/team_screen.dart';

class HackathonDetail extends StatelessWidget {
  const HackathonDetail({super.key, required this.selectedHack});

  final HackModel selectedHack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HackathonMainDetail(
                hackathonImage: "assets/images/hackathon_image.png",
                hackathonName: "${selectedHack.name}",
                hackathonDetail: "${selectedHack.description}",
              ),
              const SizedBox(
                height: 22,
              ),
              HackathonInfoCard(
                  location: selectedHack.location,
                  startDate: selectedHack.hackStartDate,
                  endDate: selectedHack.hackEndDate,
                  teamSize: selectedHack.teamSize.toString()),
              const SizedBox(height: 8),
              PrimaryButton(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                title: "Create team",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateTeamScreen()));
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Teams",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TeamScreen()),
                      );
                    },
                    child: const Text(
                      "View all",
                    ),
                  ),
                ],
              ),
              const TeamCard(
                teamName: "Asma team's",
                firstMemberName: 'asma ahamd',
                secondMemberName: 'abdullah khalid',
                thirdMemberName: 'sara salem',
                firstMemberRole: 'developer',
                fourMemberName: 'ahmad ali',
                secondMemberRole: 'UX/UI',
                thirdMemberRole: 'developr',
                fourMemberRole: 'UX/UI',
              ),
              const TeamCard(
                teamName: "Asma team's",
                firstMemberName: 'asma ahamd',
                secondMemberName: 'abdullah khalid',
                thirdMemberName: 'sara salem',
                firstMemberRole: 'developer',
                fourMemberName: 'ahmad ali',
                secondMemberRole: 'UX/UI',
                thirdMemberRole: 'developr',
                fourMemberRole: 'UX/UI',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
