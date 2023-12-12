part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class SkillEvent extends ProfileEvent {
  final String skill;

  SkillEvent({required this.skill});
}

class BioEvent extends ProfileEvent {
  final String bio;

  BioEvent({required this.bio});
}

class RoleEvent extends ProfileEvent {
  final String role;

  RoleEvent({required this.role});
}

class GetCurrentUserEvent extends ProfileEvent {}
