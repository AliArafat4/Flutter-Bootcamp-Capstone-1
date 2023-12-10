import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_state.dart';

class MemberInfo extends StatelessWidget {
  const MemberInfo(
      {super.key,
      required this.memberName,
      required this.memberRole,
      this.isLeader = false});

  final String memberName;
  final String memberRole;
  final bool isLeader;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memberName,
                style: const TextStyle(fontSize: 16),
              ),

              Text(
                memberRole,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),

            ],
          ),
          const Spacer(),
          isLeader
              ? MemberState(
                  title: 'leader',
                  color: const Color(0xff695678).withOpacity(0.1),
                  textColor: const Color(0xff695678),
                )
              : Container()
        ],
      ),
    );
  }
}
