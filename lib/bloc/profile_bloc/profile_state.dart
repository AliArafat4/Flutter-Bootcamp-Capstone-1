part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SuccessBioState extends ProfileState {
  final UserModel dataUser;

  SuccessBioState({required this.dataUser});
}

final class SuccessSkillState extends ProfileState {
  final UserModel dataUser;

  SuccessSkillState({required this.dataUser});
}

final class SuccessRoleState extends ProfileState {
  final UserModel dataUser;

  SuccessRoleState({required this.dataUser});
}

final class LoadingProfileState extends ProfileState {}

final class LoadingSkillState extends ProfileState {}

final class LoadingBioState extends ProfileState {}

final class ErrorSkillState extends ProfileState {
  final String errormessage;

  ErrorSkillState({required this.errormessage});
}

final class ErrorBioState extends ProfileState {
  final String errormessage;

  ErrorBioState({required this.errormessage});
}

final class GetCurrentUserState extends ProfileState {
  final UserModel user;
  GetCurrentUserState({required this.user});
}
