import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_event.dart';
import 'package:team_hack/bloc/team_bloc/team_state.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/models/team_model.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';

import '../auth/components/show_snack_bar.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key, required this.selectedHack});

  // final List<TeamModel>? teamModelList;
  // final dynamic bloc;
  final HackModel selectedHack;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TeamBloc>();
    bloc.add(LoadAllTeams(id: selectedHack.id!));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: bloc.allTeam != null
              ? Column(
                  children: [
                    BlocConsumer<TeamBloc, TeamState>(
                      builder: ((context, state) {
                        if (state is GetAllTeamSuccessState) {
                          return BlocConsumer<TeamBloc, TeamState>(
                            listener: (BuildContext context, TeamState state) {
                              state is RequsetToJoinSuccessState
                                  ? showSnackBar(
                                      context: context,
                                      message: state.successmessage)
                                  : const SizedBox();
                            },
                            builder: (context, state) {
                              return Column(
                                children: [
                                  ...bloc.allTeam!
                                      .map(
                                        (e) => TeamCard(teamModel: e),
                                      )
                                      .toList()
                                ],
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff62c1c7),
                          ),
                        );
                      }),
                      listener: (BuildContext context, TeamState state) {
                        if (state is GetAllTeamErrorState) {
                          showErrorSnackBar(context, state.errormessage);
                        }
                      },
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
