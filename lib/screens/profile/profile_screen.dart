import 'package:flutter/material.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';
import 'package:team_hack/screens/setting_screen/setting.dart';

enum SegmentType { profile, education }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
              icon: const Icon(Icons.settings))
        ],
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              ProfileImage(
                image: "assets/images/proofile_image.jpg",
              ),
              SizedBox(
                height: 8,
              ),
              PersonalInfo(
                name: "Ahamd Abdullah",
                email: "ahamad_abdullah22@gmail.com",
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Bio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              AboutSection(
                bio:
                    "Lorie Smith is a Loan Officer at XYZ Bank, where Lorie processes loan applications from start to finish, including mortgage refinancing and educating clients about their different financing options. Lorie has worked with reputable real estate agencies, including ReMax, Century 21, and Coldwell Banker, among others.",
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Skill",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SkillSection(
                      skillName: "UX/UI",
                    ),
                    SkillSection(
                      skillName: "developer",
                    ),
                    SkillSection(
                      skillName: "network",
                    ),
                    SkillSection(
                      skillName: "DB",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              DefaultTabController(
                length: 2,
                child: Center(
                  child: TabBar(
                    labelColor: Color(0xff62c1c7),
                    indicatorColor: Color(0xff62c1c7),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'My team'),
                      Tab(text: 'Requests to join'),
                    ],
                  ),
                ),
              ),
              /*
            TabBarView(children: [
              Text(
                'Tab Programming',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Tab Programming',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                'Tab Programming',
                style: TextStyle(color: Colors.red),
              ),
            ])
          ]),*/

              SizedBox(
                height: 22,
              ),
              MyTeamCard(
                hackathonImage: "assets/images/hackathon_image.png",
                hackathonName: "ai hack",
                teamName: 'sara team',
                firstMemberName: 'ahmad',
                secondMemberName: 'khalid',
                thirdMemberName: 'lama',
                fourMemberName: 'sara',
                thirdMemberRole: 'developer',
                secondMemberRole: 'ux/ui',
                firstMemberRole: 'ux/ui',
                fourMemberRole: 'developer',
              ),
              RequestToJoinCard(
                hackathonName: "AI Hackathon",
                teamRoleName: "team name | Developer",
                state: "accepted",
              ),
              RequestToJoinCard(
                hackathonName: "AI Hackathon",
                teamRoleName: "team name | Developer",
                state: "accepted",
              ),
              RequestToJoinCard(
                hackathonName: "AI Hackathon",
                teamRoleName: "team name | Developer",
                state: "accepted",
              ),
              RequestToJoinCard(
                hackathonName: "AI Hackathon",
                teamRoleName: "team name | Developer",
                state: "accepted",
              ),
              RequestToJoinCard(
                hackathonName: "AI Hackathon",
                teamRoleName: "team name | Developer",
                state: "accepted",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
