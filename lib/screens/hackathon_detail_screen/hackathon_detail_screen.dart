import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_event.dart';
import 'package:team_hack/bloc/team_bloc/team_state.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/screens/create_team/create_team_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_main_detail.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info_card.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/team_card.dart';
import 'package:team_hack/screens/team/team_screen.dart';

class HackathonDetail extends StatelessWidget {
  const HackathonDetail({super.key, required this.selectedHack});

  final HackModel selectedHack;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TeamBloc>();
    bloc.add(LoadAllTeams(id: selectedHack.id!));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HackathonMainDetail(
                hackathonImage: "assets/images/hackathon_image.png",
                hackathonName: "${selectedHack.name}",
                hackathonDetail: "${selectedHack.description}",
              ),
              const SizedBox(
                height: 22,
              ),
              HackathonInfoCard(
                  location: selectedHack.location,
                  startDate: selectedHack.hackStartDate,
                  endDate: selectedHack.hackEndDate,
                  teamSize: selectedHack.numberOfTeams.toString()),
              const SizedBox(height: 8),
              PrimaryButton(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                title: "Create team",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CreateTeamScreen(selectedHack: selectedHack),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Teams",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TeamScreen(teamModelList: bloc.allTeam)),
                      );
                    },
                    child: const Text(
                      "View all",
                    ),
                  ),
                ],
              ),
              BlocConsumer<TeamBloc, TeamState>(
                builder: ((context, state) {
                  if (state is GetAllTeamSuccessState) {
                    return Column(
                      children: [
                        ...bloc.allTeam!
                            .map(
                              (e) => TeamCard(teamModel: e),
                            )
                            .toList()
                      ],
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
          ),
        ),
      ),
    );
  }
}
