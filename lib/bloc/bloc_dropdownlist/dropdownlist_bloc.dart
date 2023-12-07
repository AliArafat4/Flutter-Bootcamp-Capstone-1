import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropdownlist_event.dart';
part 'dropdownlist_state.dart';

class DropdownlistBloc extends Bloc<DropdownlistEvent, DropdownlistState> {
  DropdownlistBloc() : super(DropdownlistInitial()) {
    on<DropdownlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
