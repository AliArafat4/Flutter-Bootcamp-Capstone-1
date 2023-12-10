part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class ErrorState extends SearchState {
  final String errorText;

  ErrorState({required this.errorText});
} //state if user inter number

final class SuccessState extends SearchState {
  final List<String> textResults;
  SuccessState({
    required this.textResults,
  });
} //state search success

