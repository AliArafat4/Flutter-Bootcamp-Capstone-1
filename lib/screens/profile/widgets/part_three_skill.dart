import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';
import 'package:team_hack/screens/profile/widgets/skills_section.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

class PartThreeSkill extends StatefulWidget {
  const PartThreeSkill({super.key});

  @override
  State<PartThreeSkill> createState() => _PartThreeSkillState();
}

class _PartThreeSkillState extends State<PartThreeSkill> {
  TextEditingController conSkill = TextEditingController();
  @override
  void dispose() {
    conSkill.dispose();
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
                                    controller: conSkill,
                                    content: 'Enter skill',
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
                                        .add(SkillEvent(skill: conSkill.text));
                                    conSkill.clear();
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
                current is SuccessSkillState || current is GetCurrentUserState,
            builder: (context, state) {
              if (state is GetCurrentUserState) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.user.skills!.length,
                    itemBuilder: (context, index) {
                      return SkillSection(
                        skillName: state.user.skills![index],
                      );
                    });
              } else if (state is SuccessSkillState) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.dataUser.skills!.length,
                    itemBuilder: (context, index) {
                      return SkillSection(
                        skillName: state.dataUser.skills![index],
                      );
                    });
              }
              return Container(
                child: const Text(''),
              );
            },
            listener: (BuildContext context, ProfileState state) {
              state is ErrorSkillState
                  ? showErrorSnackBar(context, state.errormessage)
                  : const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
