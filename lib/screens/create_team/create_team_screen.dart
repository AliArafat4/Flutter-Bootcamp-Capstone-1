import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/create_new_team/create_new_team.state.dart';
import 'package:team_hack/bloc/create_new_team/create_new_team_bloc.dart';
import 'package:team_hack/bloc/create_new_team/create_new_team_event.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/method/show_dilog.dart';
import 'package:team_hack/method/show_loading.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/home/home_screen.dart';

import 'components/create_team_text_field.dart';

// ignore: must_be_immutable
class CreateTeamScreen extends StatelessWidget {
  CreateTeamScreen({Key? key}) : super(key: key);

  TextEditingController teamName = TextEditingController();
  TextEditingController teamSize = TextEditingController();
  TextEditingController firsTeeamName = TextEditingController();
  TextEditingController seacondTeeamName = TextEditingController();
  TextEditingController thirdTeamName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
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
                CreateTeamTextField(
                    keyboardType: TextInputType.name,
                    controller: teamName,
                    content: "Team Name"),
                CreateTeamTextField(
                    keyboardType: TextInputType.number,
                    controller: teamSize,
                    content: "Team size //from db hackathon"),
                CreateTeamTextField(
                    keyboardType: TextInputType.name,
                    controller: firsTeeamName,
                    content: "Member Name 1"),
                CreateTeamTextField(
                    keyboardType: TextInputType.name,
                    controller: seacondTeeamName,
                    content: "Member Name 2"),
                CreateTeamTextField(
                    keyboardType: TextInputType.name,
                    controller: thirdTeamName,
                    content: "Member Name 3"),
                BlocListener<CreateNewTeamBloc, CreateNewTeamState>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      loading(context: context);
                      Navigator.of(context).pop();
                    } else if (state is CreateTeamSuccessState) {
                      showSuccessDiolg(
                          func: () {
                            //change to pushNamedAndRemoveUntil
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          context: context,
                          successMessage: state.successmessage);
                    } else if (state is CreateTeamErrorState) {
                      showErrorSnackBar(context, state.errormessage);
                    }
                  },
                  child: PrimaryButton(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 16,
                    title: "Create",
                    onPressed: () async {
                      context.read<CreateNewTeamBloc>().add(CreateTeamEvent(
                          teamName: teamName.text,
                          firstMemberName: firsTeeamName.text,
                          secondMemberName: seacondTeeamName.text,
                          thirdMemberName: thirdTeamName.text));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
