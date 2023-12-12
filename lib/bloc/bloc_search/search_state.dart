part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class EmptyState extends SearchState {}
final class LoadingState extends SearchState {}

final class SuccessState extends SearchState {
  List<HackModel> hackList;

  SuccessState(this.hackList);
}

final class ErrorState extends SearchState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}  //state search success

