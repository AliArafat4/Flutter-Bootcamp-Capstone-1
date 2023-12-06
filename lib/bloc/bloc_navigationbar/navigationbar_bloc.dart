import 'package:bloc/bloc.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_event.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitialState(indexPage: 0)) {
    on<ClickNavigationEvent>((event, emit) {
      emit(NavigationInitialState(indexPage: event.clickIndex));
    });
  }
}
