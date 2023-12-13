import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';
import 'package:team_hack/screens/profile/widgets/about_section.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

class PartTwoBio extends StatefulWidget {
  const PartTwoBio({super.key});

  @override
  State<PartTwoBio> createState() => _PartTwoBioState();
}

class _PartTwoBioState extends State<PartTwoBio> {
  TextEditingController conBio = TextEditingController();
  @override
  void dispose() {
    conBio.dispose();
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
                                    controller: conBio,
                                    maxLines: 4,
                                    content: 'Enter bio',
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
                                        .add(BioEvent(bio: conBio.text));
                                    conBio.clear();

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
        BlocConsumer<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) =>
              current is GetCurrentUserState ||
              current is SuccessBioState ||
              current is SuccessSkillState,
          builder: (context, state) {
            if (state is GetCurrentUserState) {
              return AboutSection(
                bio: "${state.user.bio}",
              );
            } else if (state is SuccessBioState) {
              return AboutSection(
                bio: "${state.dataUser.bio}",
              );
            } else if (state is SuccessSkillState) {
              return AboutSection(
                bio: "${state.dataUser.bio}",
              );
            }
            // else if (state is LoadingBioState) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return const Text('');
          },
          listener: (BuildContext context, ProfileState state) {
            state is ErrorBioState
                ? showErrorSnackBar(context, state.errormessage)
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
