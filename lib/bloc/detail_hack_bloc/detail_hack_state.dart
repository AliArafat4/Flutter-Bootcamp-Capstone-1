part of 'detail_hack_bloc.dart';

@immutable
abstract class DetailHackState {}

class DetailHackInitial extends DetailHackState {}

class LoadingState extends DetailHackState {}

class RequestToJoinSuccessState extends DetailHackState {
  final String successMessage;

  RequestToJoinSuccessState({required this.successMessage});
}

class RequestToJoinErrorState extends DetailHackState {
  final String errorMessage;
  RequestToJoinErrorState({required this.errorMessage});
}
