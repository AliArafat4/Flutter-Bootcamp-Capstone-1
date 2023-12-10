import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
}
