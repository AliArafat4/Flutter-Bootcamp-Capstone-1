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
    on<RequestToJoin>((event, emit) {
      // TODO: implement event handler
    });
  }

  FutureOr<void> getAllTeam(LoadAllTeams event, Emitter<TeamState> emit) async {
    try {
      emit(LoadingState());
      allTeam = await SupaBaseDB().getAllTeam(event.id);
      print(allTeam!.length);
      emit(GetAllTeamSuccessState());
    } catch (error) {
      print(error);
      emit(GetAllTeamErrorState(errormessage: error.toString()));
    }
  }
}
