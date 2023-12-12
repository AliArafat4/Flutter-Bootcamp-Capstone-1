import 'package:flutter/material.dart';
import 'package:team_hack/screens/profile/widgets/part_five_tabBar.dart';
import 'package:team_hack/screens/profile/widgets/part_four_role.dart';
import 'package:team_hack/screens/profile/widgets/part_one_image.dart';
import 'package:team_hack/screens/profile/widgets/part_three_skill.dart';
import 'package:team_hack/screens/profile/widgets/part_two_bio.dart';
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
        leading: const SizedBox(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              SizedBox(
                height: 8,
              ),
              PartOneImage(),
              SizedBox(
                height: 50,
              ),
              PartTwoBio(),
              SizedBox(
                height: 22,
              ),
              PartFourRole(),
              PartThreeSkill(),

              // SizedBox(
              //   height: 22,
              // ),
              PartFiveTabBar(),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
