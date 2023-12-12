part of 'request_cubit.dart';

@immutable
abstract class RequestState {}

class RequestInitial extends RequestState {}

class RequestGetDataState extends RequestState {
  final List<RequestModel> requestModel;
  RequestGetDataState({required this.requestModel});
}

class RequestErrorState extends RequestState {}

class RequestSuccessState extends RequestState {
  final String msg;

  RequestSuccessState({required this.msg});
}
