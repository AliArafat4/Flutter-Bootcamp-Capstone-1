part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SuccessState extends ProfileState {
  final UserModel dataUser;

  SuccessState({required this.dataUser});
}

final class LoadingProfileState extends ProfileState {}

final class ErrorState extends ProfileState {
  final String errormessage;

  ErrorState({required this.errormessage});
}

final class GetCurrentUserState extends ProfileState {
  final UserModel user;
  GetCurrentUserState({required this.user});
}
