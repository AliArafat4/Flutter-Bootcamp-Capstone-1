import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_info.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';

class TeamCard extends StatelessWidget {
  const TeamCard(
      {super.key,
      required this.firstMemberName,
      required this.secondMemberName,
      required this.thirdMemberName,
      required this.fourMemberName,
      required this.firstMemberRole,
      required this.secondMemberRole,
      required this.thirdMemberRole,
      required this.fourMemberRole,
      required this.teamName});

  final String teamName;
  final String firstMemberName,
      secondMemberName,
      thirdMemberName,
      fourMemberName;
  final String firstMemberRole,
      secondMemberRole,
      thirdMemberRole,
      fourMemberRole;

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
                teamName,
                style: const TextStyle(fontSize: 18, color: Color(0xff695678)),
              ),
              const Divider(
                endIndent: 32,
              ),
              const SizedBox(height: 8),
              MemberInfo(
                memberName: firstMemberName,
                memberRole: firstMemberRole,
                isLeader: true,
              ),
              MemberInfo(
                memberName: secondMemberName,
                memberRole: secondMemberRole,
              ),
              MemberInfo(
                memberName: thirdMemberName,
                memberRole: thirdMemberRole,
              ),
              MemberInfo(
                memberName: fourMemberName,
                memberRole: fourMemberRole,
              ),
              Center(
                child: SecondButton(
                  textColor: const Color(0xff62c1c7),
                  width: MediaQuery.of(context).size.width - 160,
                  height: MediaQuery.of(context).size.height / 16,
                  title: "Request to join",
                  onPressed: () {},
                  borderColor: const Color(0xff62c1c7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
