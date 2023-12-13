import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_event.dart';
import 'package:team_hack/bloc/team_bloc/team_state.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/models/team_model.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';
import 'package:team_hack/widgets/empty_state.dart';

import '../auth/components/show_snack_bar.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key, required this.selectedHack});

  final HackModel selectedHack;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TeamBloc>();
    bloc.add(LoadAllTeams(id: selectedHack.id!));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<TeamBloc, TeamState>(
            listener: (BuildContext context, TeamState state) {
              state is RequsetToJoinSuccessState
                  ? showSuccessSnackBar(context, state.successmessage)
                  : const SizedBox();
              state is GetAllTeamErrorState
                  ? showErrorSnackBar(context, state.errormessage)
                  : const SizedBox();
            },
            builder: (context, state) {
              return state is GetAllTeamSuccessState
                  ? bloc.allTeam!.isNotEmpty
                      ? ListView(
                          shrinkWrap: true,
                          children: [
                            ...bloc.allTeam!
                                .map((e) => TeamCard(teamModel: e))
                                .toList()
                          ],
                        )
                      : const Center(
                          child: EmptyStateUI(
                              title: "No Teams",
                              subTitle:
                                  "Sorry, There are no Teams in This Hackathons yet",
                              image: "assets/images/no_search_result.png"),
                        )
                  : const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xff62c1c7)));
            },
          )),
    );
  }
}
