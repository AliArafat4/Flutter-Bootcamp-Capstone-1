part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email, password;
  AuthLoginEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String email, password, userName, confirmPassword;
  // final BuildContext context;
  AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.userName,
    required this.confirmPassword,
  });
}
