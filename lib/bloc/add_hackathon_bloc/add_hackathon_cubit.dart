import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
part 'add_hackathon_state.dart';

class AddHackathonCubit extends Cubit<AddHackathonState> {
  AddHackathonCubit() : super(AddHackathonInitial());

  changeRadioCubit({required String selectedType}) {
    emit(AddHackathonRadioState(type: selectedType));
  }

  changeFieldCubit({required String selectedField}) {
    emit(AddHackathonFieldState(field: selectedField));
  }

  changeTeamSizeCubit({required String size}) {
    emit(AddHackathonNumberOfTeamMembersState(teamSize: size));
  }

  changeHackStartRegDate({required BuildContext context}) async {
    final time = await selectDateHack(context);
    emit(AddHackathonStartRegDateState(startRegDate: time));
  }

  changeHackEndRegDate({required BuildContext context}) async {
    final time = await selectDateHack(context);

    emit(AddHackathonEndRegDateState(endRegDate: time));
  }

  changeHackStartDate({required BuildContext context}) async {
    final time = await selectDateHack(context);

    emit(AddHackathonStartHackDateState(startHackDate: time));
  }

  changeHackEndDate({required BuildContext context}) async {
    final time = await selectDateHack(context);

    emit(AddHackathonEndHackDateState(endHackDate: time));
  }

  selectDateHack(BuildContext context) async {
    final DateTime _date = DateTime.now();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(hours: 10000)),
    );
    return date?.toIso8601String();
  }
}
