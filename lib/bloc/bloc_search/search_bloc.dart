import 'package:bloc/bloc.dart';
import 'package:team_hack/data/global.dart';

part 'search_event.dart';
part 'search_state.dart';

//get data field from database
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      try {
        if (event.textSearch.isNotEmpty) {
          searchResults = listSearch.keys
              .where((key) =>
                  key.toLowerCase().contains(event.textSearch.toLowerCase()))
              .toList();
          print(event.textSearch);
          emit(SuccessState(
            textResults: searchResults,
          ));
        }
      } catch (error) {
        throw FormatException('Error with $error');
      }
    });
  }
}
