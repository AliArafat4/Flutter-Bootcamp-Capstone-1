import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';

import 'components/create_team_text_field.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_sharp),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.getHeight(factor: .1)),
                    const Text(
                      "Create new team",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Color(0xff62c1c7)),
                    ),
                    Text(
                      "Enter your team details to create team",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const CreateTeamTextField(content: "Team Name"),
                const CreateTeamTextField(
                    content: "Team size //from db hackathon"),
                const CreateTeamTextField(content: "Member Name 1"),
                const CreateTeamTextField(content: "Member Name 2"),
                const CreateTeamTextField(content: "Member Name 3"),
                PrimaryButton(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 16,
                    title: "Create",
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
