part of 'hack_cubit.dart';

@immutable
abstract class HackState {}

class HackInitial extends HackState {}

class AddHackSuccessState extends HackState {}

class AddHackLoadingState extends HackState {}

class AddHackErrorState extends HackState {
  final String errMsg;

  AddHackErrorState({required this.errMsg});
}

class GetAllHacksState extends HackState {
  final List<HackModel> hackModel;

  GetAllHacksState({required this.hackModel});
}

class GetAllHacksErrorState extends HackState {
  final String errMsg;

  GetAllHacksErrorState({required this.errMsg});
}
