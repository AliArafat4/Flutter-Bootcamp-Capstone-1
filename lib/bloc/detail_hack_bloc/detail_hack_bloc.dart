import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_hack_event.dart';
part 'detail_hack_state.dart';

class DetailHackBloc extends Bloc<DetailHackEvent, DetailHackState> {
  DetailHackBloc() : super(DetailHackInitial()) {
    on<RequestToJoinEvent>((event, emit) {
    
    });
  }
}
