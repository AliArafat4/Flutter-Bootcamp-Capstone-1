class TeamModel {
  late final int? id;
  late final String? teamName;
  late final String? firstMemberName;
  late final String? secondMemberName;
  late final String? thirdMemberName;
  late final String? fourthMemberName;
  late final String? fifthMemberName;
  late final bool? isLeader;

  TeamModel(
      {this.id,
      this.teamName,
      this.firstMemberName,
      this.secondMemberName,
      this.thirdMemberName,
      this.fourthMemberName,
      this.fifthMemberName,
      this.isLeader});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    firstMemberName = json['first_member_name'];
    secondMemberName = json['second_member_name'];
    thirdMemberName = json['third_member_name'];
    fourthMemberName = json['fourth_member_name'];
    fifthMemberName = json['fifth_member_name'];
    isLeader = json['is_leader'];
  }
}
