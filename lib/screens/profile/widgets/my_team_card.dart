import 'package:flutter/material.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/member_info.dart';

class MyTeamCard extends StatelessWidget {
  const MyTeamCard(
      {super.key,
      required this.teamName,
      required this.firstMemberName,
      required this.secondMemberName,
      required this.thirdMemberName,
      required this.fourMemberName,
      required this.firstMemberRole,
      required this.secondMemberRole,
      required this.thirdMemberRole,
      required this.fourMemberRole,
      required this.hackathonName,
      required this.hackathonImage});
  final String hackathonImage;
  final String hackathonName;
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
            color: Theme.of(context).colorScheme.secondary),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                      child: Image.asset(
                    hackathonImage,
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hackathonName,
                        style: const TextStyle(
                            fontSize: 18, color: Color(0xff695678)),
                      ),
                      Text(
                        teamName,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                endIndent: 2,
              ),
              const SizedBox(height: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}
