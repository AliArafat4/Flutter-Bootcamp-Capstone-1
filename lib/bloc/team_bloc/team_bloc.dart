import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/team_bloc/team_event.dart';
import 'package:team_hack/bloc/team_bloc/team_state.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/team_model.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  List<TeamModel>? allTeam;
  TeamBloc() : super(TeamInitial()) {
    on<LoadAllTeams>(getAllTeam);
    on<RequestToJoin>((event, emit) async {
      // TODO: implement event handler
      await SupaBaseDB().sendRequest(teamID: event.teamID);
      emit(RequsetToJoinSuccessState(
          successmessage: "Request sent successfully"));
      emit(GetAllTeamSuccessState());
    });
  }

  FutureOr<void> getAllTeam(LoadAllTeams event, Emitter<TeamState> emit) async {
    try {
      emit(LoadingState());
      allTeam = await SupaBaseDB().getAllTeam(event.id);

      emit(GetAllTeamSuccessState());
    } catch (error) {
      print(error);
      emit(GetAllTeamErrorState(errormessage: error.toString()));
    }
  }
}
