import 'package:team_hack/models/user_model.dart';

import 'package:team_hack/models/user_model.dart';

import 'package:team_hack/models/user_model.dart';

import 'package:team_hack/models/user_model.dart';

import 'package:team_hack/models/user_model.dart';

class TeamModel {
  late final int? id;
  late final String? teamName;
  // late final String? firstMemberName;
  // late final String? secondMemberName;
  // late final String? thirdMemberName;
  // late final String? fourthMemberName;
  // late final String? fifthMemberName;
  late final UserModel? firstMemberModel;
  late final UserModel? secondMemberModel;
  late final UserModel? thirdMemberModel;
  late final UserModel? fourthMemberModel;
  late final UserModel? fifthMemberModel;
  late final bool? isLeader;

  TeamModel(
      {this.id,
      this.teamName,
      this.firstMemberModel,
      this.secondMemberModel,
      this.thirdMemberModel,
      this.fourthMemberModel,
      this.fifthMemberModel,
      this.isLeader});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    // firstMemberModel = json['first_member_name'];
    // secondMemberModel = json['second_member_name'];
    // thirdMemberModel = json['third_member_name'];
    // fourthMemberModel = json['fourth_member_name'];
    // fifthMemberModel = json['fifth_member_name'];
    isLeader = json['is_leader'];
  }
}
