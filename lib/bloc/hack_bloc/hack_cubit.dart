import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/hack_model.dart';

part 'hack_state.dart';

class HackCubit extends Cubit<HackState> {
  HackCubit() : super(HackInitial());

  addHackFunc({
    required String name,
    required String teamSize,
    required String numberOfTeams,
    required DateTime? starRegDate,
    required DateTime? endRegDate,
    required DateTime? hackStartDate,
    required DateTime? hackEndDate,
    required String field,
    required String description,
    required String location,
  }) async {
    if (name.isNotEmpty &&
        teamSize.isNotEmpty &&
        numberOfTeams.isNotEmpty &&
        starRegDate != null &&
        endRegDate != null &&
        hackStartDate != null &&
        hackEndDate != null &&
        field.isNotEmpty &&
        description.isNotEmpty &&
        location.isNotEmpty) {
      final response = await SupaBaseDB().addHack(
          name: name,
          teamSize: int.tryParse(teamSize)!,
          numberOfTeams: int.tryParse(numberOfTeams)!,
          starRegDate: starRegDate.toIso8601String(),
          endRegDate: endRegDate.toIso8601String(),
          hackStartDate: hackStartDate.toIso8601String(),
          hackEndDate: hackEndDate.toIso8601String(),
          field: field,
          description: description,
          location: location);
      if (response) {
        emit(AddHackSuccessState());
        getAllHacksFunc();
      } else {
        emit(AddHackErrorState(errMsg: "An Error has Occurred"));
        getAllHacksFunc();
      }
    } else {
      emit(AddHackErrorState(errMsg: "Please Fill the Required Fields"));
      getAllHacksFunc();
    }
  }

  getAllHacksFunc({String field = "*"}) async {
    emit(AddHackLoadingState());

    final hackModel = await SupaBaseDB().getAllHack(field: field);

    if (hackModel.toString().toLowerCase().contains("does not exist")) {
      emit(GetAllHacksErrorState(errMsg: hackModel.toString()));
    } else if (hackModel.isEmpty) {
      emit(AddHackNoDataState());
    } else {
      emit(GetAllHacksState(hackModel: hackModel));
    }
  }

  dateFormatFunc({required String time}) {
    // final day = DateFormat.E().format(DateTime.parse(time));
    // final hrs = DateFormat.Hms().format(DateTime.parse(time));
    print(time);
    final date = DateTime.parse(time);

    return date;
  }
}
