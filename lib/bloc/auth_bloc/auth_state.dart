part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;
  AuthLoginErrorState({required this.errorMsg});
}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterErrorState extends AuthState {
  final String errorMsg;
  AuthRegisterErrorState({required this.errorMsg});
}

class LoadingState extends AuthState {}

class AuthGetCurrentUserState extends AuthState {
  final UserModel user;
  AuthGetCurrentUserState({required this.user});
}
