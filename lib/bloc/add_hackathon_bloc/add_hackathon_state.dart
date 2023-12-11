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

class AddHackathonStartRegDateState extends AddHackathonState {
  final String? startRegDate;
  AddHackathonStartRegDateState({required this.startRegDate});
}

class AddHackathonEndRegDateState extends AddHackathonState {
  final String? endRegDate;
  AddHackathonEndRegDateState({required this.endRegDate});
}

class AddHackathonStartHackDateState extends AddHackathonState {
  final String? startHackDate;
  AddHackathonStartHackDateState({required this.startHackDate});
}

class AddHackathonEndHackDateState extends AddHackathonState {
  final String? endHackDate;
  AddHackathonEndHackDateState({required this.endHackDate});
}

class AddHackathonGetLocationState extends AddHackathonState {
  final String? location;
  AddHackathonGetLocationState({required this.location});
}
