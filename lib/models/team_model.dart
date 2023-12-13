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
  // late final UserModel? fifthMemberModel;
  late final bool? isLeader;

  TeamModel(
      {this.id,
      this.teamName,
      this.firstMemberModel,
      this.secondMemberModel,
      this.thirdMemberModel,
      this.fourthMemberModel,
      // this.fifthMemberModel,
      this.isLeader});

  TeamModel.fromJson(Map<String, dynamic> json,
      {UserModel? user1,
      UserModel? user2,
      UserModel? user3,
      UserModel? user4}) {
    id = json['id'];
    teamName = json['team_name'];
    firstMemberModel = user1; // json['first_member_name'];
    secondMemberModel = user2; //json['second_member_name'];
    thirdMemberModel = user3; //json['third_member_name'];
    fourthMemberModel = user4; //json['fourth_member_name'];
    // fifthMemberModel = json['fifth_member_name'];
    isLeader = json['is_leader'];
  }
}
