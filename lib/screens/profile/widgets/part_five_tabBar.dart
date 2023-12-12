import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/profile/widgets/my_team_card.dart';
import 'package:team_hack/screens/profile/widgets/request_to_join_card.dart';

class PartFiveTabBar extends StatelessWidget {
  const PartFiveTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const Center(
            child: TabBar(
              labelColor: Color(0xff62c1c7),
              indicatorColor: Color(0xff62c1c7),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'My team'),
                Tab(text: 'Requests to join'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: context.getHeight(factor: 0.4),
            child: TabBarView(children: [
              const MyTeamCard(
                hackathonImage: "assets/images/hackImage.png",
                hackathonName: "ai hack",
                teamName: 'sara team',
                firstMemberName: 'ahmad',
                secondMemberName: 'khalid',
                thirdMemberName: 'lama',
                fourMemberName: 'sara',
                thirdMemberRole: 'developer',
                secondMemberRole: 'ux/ui',
                firstMemberRole: 'ux/ui',
                fourMemberRole: 'developer',
              ),
              ListView(
                shrinkWrap: true,
                children: const [
                  RequestToJoinCard(
                    hackathonName: "AI Hackathon",
                    teamRoleName: "team name | Developer",
                    state: "accepted",
                  ),
                  RequestToJoinCard(
                    hackathonName: "AI Hackathon",
                    teamRoleName: "team name | Developer",
                    state: "accepted",
                  ),
                  RequestToJoinCard(
                    hackathonName: "AI Hackathon",
                    teamRoleName: "team name | Developer",
                    state: "accepted",
                  ),
                  RequestToJoinCard(
                    hackathonName: "AI Hackathon",
                    teamRoleName: "team name | Developer",
                    state: "accepted",
                  ),
                  RequestToJoinCard(
                    hackathonName: "AI Hackathon",
                    teamRoleName: "team name | Developer",
                    state: "accepted",
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
