import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/hack_model.dart';
part 'search_event.dart';
part 'search_state.dart';

//get data field from database
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<HackModel> haclist = [];
  SearchBloc() : super(SearchInitial()) {
    on<SearchStateEvent>((event, emit) async {
      emit(LoadingState());
      try {
        if (event.textSearch.isNotEmpty) {
          haclist = await SupaBaseDB().getHackathon(hackName: event.textSearch);
          if (haclist.isEmpty) {
            emit(EmptyState());
          } else {
            emit(SuccessState(haclist));
          }
        } else {
          emit(SearchInitial());
        }
      } catch (error) {
        emit(ErrorState("$error"));
      }
    }, transformer: restartable());
  }
}
