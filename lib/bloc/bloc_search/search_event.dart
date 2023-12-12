part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchStateEvent extends SearchEvent {
  final String textSearch;
  SearchStateEvent({required this.textSearch});
}
