import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_event.dart';
import 'package:team_hack/bloc/team_bloc/team_state.dart';
import 'package:team_hack/models/team_model.dart';
import 'package:team_hack/screens/auth/components/show_snack_bar.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_info.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.teamModel,
  });

  final TeamModel teamModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary,
        ),
        width: MediaQuery.of(context).size.width,
        height: 348,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${teamModel.teamName}",
                style: const TextStyle(fontSize: 18, color: Color(0xff695678)),
              ),
              Divider(
                endIndent: 32,
                color: Colors.grey.withOpacity(0.4),
              ),
              const SizedBox(height: 8),
              MemberInfo(
                memberName: teamModel.firstMemberModel?.name ?? "No user",
                memberRole: teamModel.firstMemberModel?.role ?? "",
                isLeader: teamModel.isLeader ?? false,
              ),
              MemberInfo(
                memberName:
                    teamModel.secondMemberModel?.name ?? "No Team member",
                memberRole: teamModel.secondMemberModel?.role ?? "",
                isLeader: false,
              ),
              MemberInfo(
                memberName:
                    teamModel.thirdMemberModel?.name ?? "No Team member",
                memberRole: teamModel.thirdMemberModel?.role ?? "",
                isLeader: false,
              ),
              MemberInfo(
                memberName:
                    teamModel.fourthMemberModel?.name ?? "No Team member",
                memberRole: teamModel.fourthMemberModel?.role ?? "",
                isLeader: false,
              ),
              Center(
                child: BlocBuilder<TeamBloc, TeamState>(
                  builder: (context, state) {
                    return SecondButton(
                      textColor: const Color(0xff62c1c7),
                      width: MediaQuery.of(context).size.width - 160,
                      height: MediaQuery.of(context).size.height / 16,
                      title: "Request to join",
                      onPressed: () {
                        context
                            .read<TeamBloc>()
                            .add(RequestToJoin(teamID: teamModel.id!));
                      },
                      borderColor: const Color(0xff62c1c7),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
