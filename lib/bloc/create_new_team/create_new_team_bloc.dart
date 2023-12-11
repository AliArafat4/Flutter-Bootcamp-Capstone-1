import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/create_new_team/create_new_team.state.dart';
import 'package:team_hack/bloc/create_new_team/create_new_team_event.dart';
import 'package:team_hack/db/supabase_db.dart';

class CreateNewTeamBloc extends Bloc<CreateNewTeamEvent, CreateNewTeamState> {
  CreateNewTeamBloc() : super(CreateTeamInitial()) {
    on<CreateTeamEvent>((event, emit) async {
      emit(LoadingState());
      try {
        if (event.teamName.isNotEmpty
            //&&
            // event.firstMemberName.isNotEmpty &&
            // event.secondMemberName.isNotEmpty &&
            // event.thirdMemberName.isNotEmpty
            ) {
          if (event.teamName.length > 2
              //&&
              // event.firstMemberName.length > 2 &&
              // event.secondMemberName.length > 2 &&
              // event.thirdMemberName.length > 2
              ) {
            final respons = await SupaBaseDB().addNewTeam(
              hackId: event.hackID,
              teamName: event.teamName,
              // firstMemberName: event.firstMemberName,
              // secondMemberName: event.secondMemberName,
              // thirdMemberName: event.thirdMemberName,
            );
            {
              if (respons) {
                emit(CreateTeamSuccessState(
                    successmessage: "The team has been created successfully"));
              } else {
                emit(CreateTeamErrorState(
                    errormessage: "Something error, try again"));
              }
            }
          } else {
            emit(CreateTeamErrorState(
                errormessage: "Please enter correct name"));
          }
        } else {
          emit(
              CreateTeamErrorState(errormessage: "Please complete all fields"));
        }
      } catch (error) {
        emit(CreateTeamErrorState(errormessage: "$error"));
      }
    });
  }
}
