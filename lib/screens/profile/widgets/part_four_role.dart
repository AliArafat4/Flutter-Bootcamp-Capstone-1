import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

class PartFourRole extends StatefulWidget {
  const PartFourRole({super.key});

  @override
  State<PartFourRole> createState() => _PartFourRoleState();
}

class _PartFourRoleState extends State<PartFourRole> {
  TextEditingController conRole = TextEditingController();
  @override
  void dispose() {
    conRole.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Role",
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
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CreateHackathonTextFiled(
                                    controller: conRole,
                                    content: 'Enter role',
                                    isDisabled: false,
                                  ),
                                ),
                                SecondButton(
                                  textColor: const Color(0xff62c1c7),
                                  width:
                                      MediaQuery.of(context).size.width - 160,
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  title: "Add",
                                  onPressed: () {
                                    context
                                        .read<ProfileBloc>()
                                        .add(RoleEvent(role: conRole.text));
                                    conRole.clear();
                                    Navigator.pop(context);
                                    //  conRole.clear();
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
        SizedBox(
          height: 50,
          child: BlocConsumer<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) =>
                current is GetCurrentUserState || current is SuccessRoleState,
            builder: (context, state) {
              if (state is GetCurrentUserState) {
                return AboutSection(
                  bio: "${state.user.role}",
                );
              } else if (state is SuccessRoleState) {
                return AboutSection(
                  bio: "${state.dataUser.role}",
                );
              }
              return Container(
                child: const Text(''),
              );
            },
            listener: (BuildContext context, ProfileState state) {
              state is ErrorRoleState
                  ? showErrorSnackBar(context, state.errormessage)
                  : const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
