part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class LoadingState extends NotificationState {}

class AccepteSuccessState extends NotificationState {
  final String successMessage;

  AccepteSuccessState({required this.successMessage});
}

class AccepteErrorState extends NotificationState {
  final String errorMessage;
  AccepteErrorState({required this.errorMessage});
}

class RejectSuccessState extends NotificationState {
  final String successMessage;

  RejectSuccessState({required this.successMessage});
}

class RejectErrorState extends NotificationState {
  final String errorMessage;
  RejectErrorState({required this.errorMessage});
}
