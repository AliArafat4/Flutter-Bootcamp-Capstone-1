import 'package:flutter/material.dart';
import 'package:team_hack/screens/create_team/create_team_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info_card.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';

class HackathonDetail extends StatelessWidget {
  const HackathonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_sharp),
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/hackathon_image.png",
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "AI Creation Hackathon",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0477f4)),
              ),
              Text(
                "Join us in a unique experience focused on image creations using artificial intelligence. A customized experience for everyone, whether you are a marketer, social media expert, artist or even someone who wants to explore the world of artificial intelligence. Participate with us virtually, starting at 6pm on December 7th until 6pm on December 9th and discover new possibilities.",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(height: 16),
              const HackathonInfoCard(),
              const SizedBox(height: 16),
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
                color: const Color(0xff0477f4),
                textColor: Colors.white,
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
                    onPressed: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(color: Color(0xff0477f4)),
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
