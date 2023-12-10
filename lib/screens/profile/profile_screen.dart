import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';
import 'package:team_hack/screens/setting_screen/setting.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const ProfileImage(
                image: "assets/images/proofile_image.jpg",
              ),
              const SizedBox(
                height: 8,
              ),
              const PersonalInfo(
                name: "Ahamd Abdullah",
                email: "ahamad_abdullah22@gmail.com",
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Bio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const AboutSection(
                bio:
                    "Lorie Smith is a Loan Officer at XYZ Bank, where Lorie processes loan applications from start to finish, including mortgage refinancing and educating clients about their different financing options. Lorie has worked with reputable real estate agencies, including ReMax, Century 21, and Coldwell Banker, among others.",
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                "Skill",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              const SingleChildScrollView(
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
              const SizedBox(
                height: 22,
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const Center(
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
                    SizedBox(
                      height: context.getHeight(factor: 0.5),
                      child: TabBarView(children: [
                        const MyTeamCard(
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
                        ListView(
                          shrinkWrap: true,
                          children: const [
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
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
