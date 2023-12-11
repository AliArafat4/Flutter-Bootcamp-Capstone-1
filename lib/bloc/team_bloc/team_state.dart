abstract class TeamState {}

final class TeamInitial extends TeamState {}

final class LoadingState extends TeamState {}

final class GetAllTeamSuccessState extends TeamState {}

final class GetAllTeamErrorState extends TeamState {
  final String errormessage;

  GetAllTeamErrorState({required this.errormessage});
}

final class RequsetToJoinErrorState extends TeamState {
  final String errormessage;

  RequsetToJoinErrorState({required this.errormessage});
}

final class RequsetToJoinSuccessState extends TeamState {
  final String successmessage;

  RequsetToJoinSuccessState({required this.successmessage});
}
