part of 'add_hackathon_cubit.dart';

@immutable
abstract class AddHackathonState {}

class AddHackathonInitial extends AddHackathonState {
  final String initialState = "Online";
}

class AddHackathonRadioState extends AddHackathonState {
  final String type;
  AddHackathonRadioState({required this.type});
}

class AddHackathonFieldState extends AddHackathonState {
  final String field;
  AddHackathonFieldState({required this.field});
}

class AddHackathonNumberOfTeamMembersState extends AddHackathonState {
  final String teamSize;
  AddHackathonNumberOfTeamMembersState({required this.teamSize});
}
