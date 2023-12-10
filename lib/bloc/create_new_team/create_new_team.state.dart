abstract class CreateNewTeamState {}

class CreateTeamInitial extends CreateNewTeamState {}

class LoadingState extends CreateNewTeamState {}

class CreateTeamSuccessState extends CreateNewTeamState {
  final String successmessage;
  CreateTeamSuccessState({required this.successmessage});
}

class CreateTeamErrorState extends CreateNewTeamState {
  final String errormessage;
  CreateTeamErrorState({required this.errormessage});
}
