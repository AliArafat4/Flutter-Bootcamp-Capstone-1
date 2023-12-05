import 'package:flutter/material.dart';
import 'package:team_hack/screens/create_team/components/create_team_button.dart';

import 'components/create_team_text_field.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const CreateTeamTextField(content: "Team Name"),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const CreateTeamTextField(content: "Team size //from db hackathon"),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const CreateTeamTextField(content: "Member Name 1"),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const CreateTeamTextField(content: "Member Name 2"),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const CreateTeamTextField(content: "Member Name 3"),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            CreateTeamButton(content: "Create Team", onPressedFunc: () {})
          ],
        ),
      ),
    );
  }
}
