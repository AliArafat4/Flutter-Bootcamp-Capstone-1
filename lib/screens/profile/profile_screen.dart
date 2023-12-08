import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/theme_bloc/them_bloc.dart';
import 'package:team_hack/bloc/theme_bloc/them_event.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';

enum SegmentType { profile, education }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_sharp),
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text("Profile"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeEvent(themeText: "light"));
            },
            icon: const Icon(
              Icons.sunny,
              color: Colors.amber,
            ),
          ),
          IconButton(
              onPressed: () {
                context
                    .read<ThemeBloc>()
                    .add(ChangeThemeEvent(themeText: "dark"));
              },
              icon: Icon(
                Icons.nightlight,
                color: Colors.blue[800],
              ))
        ],
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
                height: 28,
              ),
              Text(
                "Bio",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 8,
              ),
              AboutSection(
                bio:
                    "Lorie Smith is a Loan Officer at XYZ Bank, where Lorie processes loan applications from start to finish, including mortgage refinancing and educating clients about their different financing options. Lorie has worked with reputable real estate agencies, including ReMax, Century 21, and Coldwell Banker, among others.",
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Skill",
                style: TextStyle(fontSize: 20),
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
                height: 90,
              ),
              MyTeamCard(
                hackathonImage: "assets/images/hackathon_image.png",
                hackathonName: "ai hack",
                teamName: 'sara team',
                firstMemberName: 'k',
                secondMemberName: 'll',
                thirdMemberName: 'nn',
                fourMemberName: 'nn',
                thirdMemberRole: 'll',
                secondMemberRole: 'll',
                firstMemberRole: 'mm',
                fourMemberRole: 'kk',
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
