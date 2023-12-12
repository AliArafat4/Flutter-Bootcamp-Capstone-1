import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/data/global.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';

import 'package:team_hack/screens/profile/widgets/part_five_tabBar.dart';
import 'package:team_hack/screens/profile/widgets/part_four_role.dart';
import 'package:team_hack/screens/profile/widgets/part_one_image.dart';
import 'package:team_hack/screens/profile/widgets/part_three_skill.dart';
import 'package:team_hack/screens/profile/widgets/part_two_bio.dart';

import 'package:team_hack/screens/setting_screen/setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController conSkill = TextEditingController();
  TextEditingController conBio = TextEditingController();
  String? imageUrl;
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
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    ProfileImage(
                        uploadImageFunc: () async {
                          DateTime now = DateTime.now();
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image == null) {
                            return;
                          }
                          final ImageBytes = await image.readAsBytes();
                          final supabase = Supabase.instance.client;
                          final userId = supabase.auth.currentUser!.id;
                          final imagePath = "/$userId/image_hack_$now.png";
                          await supabase.storage
                              .from("image_hack")
                              .uploadBinary(imagePath, ImageBytes);
                          imageUrl = supabase.storage
                              .from("image_hack")
                              .getPublicUrl(imagePath);
                          setState(() {});
                        },
                        image: imageUrl),
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
                    const Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        // PartOneImage(),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        PartTwoBio(),
                        SizedBox(
                          height: 22,
                        ),
                        PartFourRole(),
                        PartThreeSkill(),

                        // SizedBox(
                        //   height: 22,
                        // ),
                        // PartFiveTabBar(),
                        // SizedBox(
                        //   height: 22,
                        // ),
                      ],
                    ),
                  ]))),
    );
  }
}
