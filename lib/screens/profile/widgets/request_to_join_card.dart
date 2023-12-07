import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_state.dart';

class RequestToJoin extends StatelessWidget {
  const RequestToJoin(
      {super.key,
      required this.hackathonName,
      required this.teamRoleName,
      required this.state});
  final String hackathonName;
  final String teamRoleName;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.2),
        ),
        width: MediaQuery.of(context).size.width,
        height: 348,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hackathonName),
              Text(teamRoleName),
              MemberState(
                title: state,
                color: Colors.grey.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
