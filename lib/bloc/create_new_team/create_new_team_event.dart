abstract class CreateNewTeamEvent {}

class CreateTeamEvent extends CreateNewTeamEvent {
  final String teamName, firstMemberName, secondMemberName, thirdMemberName;

  CreateTeamEvent(
      {required this.teamName,
      required this.firstMemberName,
      required this.secondMemberName,
      required this.thirdMemberName});
}
