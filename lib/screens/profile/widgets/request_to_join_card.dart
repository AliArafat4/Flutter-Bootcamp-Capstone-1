import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_state.dart';

class RequestToJoinCard extends StatelessWidget {
  const RequestToJoinCard(
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
            color: Theme.of(context).colorScheme.secondary),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 22, right: 16, bottom: 16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hackathonName,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff695678)),
                      ),
                      Text(
                        teamRoleName,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  MemberState(
                      title: state,
                      color: const Color(0xff00bb27).withOpacity(0.1),
                      textColor: const Color(0xff00bb27)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
