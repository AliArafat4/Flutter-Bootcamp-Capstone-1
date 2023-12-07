import 'package:flutter/material.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_sharp),
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/hackathon_image.png",
                    width: MediaQuery.of(context).size.width / 4,
                    //height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                const RequestToJoin(
                  hackathonName: "AI Hackathon",
                  teamRoleName: "team name | Developer",
                  state: "accepted",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
