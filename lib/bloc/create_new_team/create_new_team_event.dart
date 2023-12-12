abstract class CreateNewTeamEvent {}

class CreateTeamEvent extends CreateNewTeamEvent {
  final String teamName
      // , firstMemberName, secondMemberName, thirdMemberName
      ;
  final int hackID;
  CreateTeamEvent({
    required this.hackID,
    required this.teamName,
    // required this.firstMemberName,
    // required this.secondMemberName,
    // required this.thirdMemberName
  });
}
