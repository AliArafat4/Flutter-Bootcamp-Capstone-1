part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}

class AccepteEvent extends NotificationEvent {}

class RejectEvent extends NotificationEvent {}
