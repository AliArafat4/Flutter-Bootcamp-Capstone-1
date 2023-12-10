import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsInitial()) {
    on<SkillsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
