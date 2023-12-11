import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';
import 'package:team_hack/screens/setting_screen/setting.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController conSkill = TextEditingController();
  TextEditingController conBio = TextEditingController();
  @override
  void dispose() {
    conSkill.dispose();
    super.dispose();
  }

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
        leading: const SizedBox(),
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
              BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) =>
                    current is GetCurrentUserState,
                builder: (context, state) {
                  return PersonalInfo(
                    name: state is GetCurrentUserState
                        ? "${state.user.name}"
                        : "...",
                    email: state is GetCurrentUserState
                        ? "${state.user.email}"
                        : "...",
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bio",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          showDragHandle: true,
                          context: context,
                          enableDrag: true,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CreateHackathonTextFiled(
                                          controller: conBio,
                                          maxLines: 4,
                                          content: 'Enter bio',
                                          isDisabled: false,
                                        ),
                                      ),
                                      SecondButton(
                                        textColor: const Color(0xff62c1c7),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                160,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        title: "Add",
                                        onPressed: () {
                                          context
                                              .read<ProfileBloc>()
                                              .add(BioEvent(bio: conBio.text));
                                          Navigator.pop(context);
                                        },
                                        borderColor: const Color(0xff62c1c7),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.edit)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is GetCurrentUserState) {
                  return AboutSection(
                    bio: "${state.user.bio}",
                  );
                } else if (state is SuccessState) {
                  return AboutSection(
                    bio: "${state.dataUser.bio}",
                  );
                } else if (state is LoadingProfileState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  child: const Text(''),
                );
              }),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Skill",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          showDragHandle: true,
                          context: context,
                          enableDrag: true,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CreateHackathonTextFiled(
                                          controller: conSkill,
                                          content: 'Enter skill',
                                          isDisabled: false,
                                        ),
                                      ),
                                      SecondButton(
                                        textColor: const Color(0xff62c1c7),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                160,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        title: "Add",
                                        onPressed: () {
                                          context.read<ProfileBloc>().add(
                                              SkillEvent(skill: conSkill.text));
                                        },
                                        borderColor: const Color(0xff62c1c7),
                                      ),
                                    ],
                                  ),
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // SkillSection(
                    //   skillName: state is AuthGetCurrentUserState
                    //       ? "${state.dataUser.skills}"
                    //       : '',
                    // ),
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
