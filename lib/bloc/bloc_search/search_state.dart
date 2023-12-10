part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SuccessState extends SearchState {
  final List<String> textResults;
  SuccessState({
    required this.textResults,
  });
} //state search success

