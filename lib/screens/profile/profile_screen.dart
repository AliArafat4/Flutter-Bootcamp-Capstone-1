import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
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
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return ListView(
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
                  PersonalInfo(
                    name: state is AuthGetCurrentUserState
                        ? "${state.user.name}"
                        : "...",
                    email: state is AuthGetCurrentUserState
                        ? "${state.user.email}"
                        : "...",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Bio",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AboutSection(
                    bio: state is AuthGetCurrentUserState
                        ? "${state.user.bio}"
                        : "...",
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Skill",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Modal BottomSheet'),
                                        ElevatedButton(
                                          child:
                                              const Text('Close BottomSheet'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SkillSection(
                          skillName: state is AuthGetCurrentUserState
                              ? "${state.user.skills}"
                              : '',
                        ),
                        const SkillSection(
                          skillName: "developer",
                        ),
                        const SkillSection(
                          skillName: "network",
                        ),
                        const SkillSection(
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
                              hackathonImage:
                                  "assets/images/hackathon_image.png",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
