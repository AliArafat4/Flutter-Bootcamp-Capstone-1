class RequestModel {
  int? id;
  String? requestFrom;
  int? teamName;
  String? requestTo;
  Users? users;
  Teams? teams;

  RequestModel(
      {this.id,
      this.requestFrom,
      this.teamName,
      this.requestTo,
      this.users,
      this.teams});

  RequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestFrom = json['request_from'];
    teamName = json['team_name'];
    requestTo = json['request_to'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['request_from'] = requestFrom;
    data['team_name'] = teamName;
    data['request_to'] = requestTo;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  List<String>? skills;
  String? bio;
  String? role;
  String? userId;
  bool? isAdmin;

  Users(
      {this.id,
      this.name,
      this.email,
      this.skills,
      this.bio,
      this.role,
      this.userId,
      this.isAdmin});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    skills = json['skills'].cast<String>();
    bio = json['bio'];
    role = json['role'];
    userId = json['user_id'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['skills'] = skills;
    data['bio'] = bio;
    data['role'] = role;
    data['user_id'] = userId;
    data['is_admin'] = isAdmin;
    return data;
  }
}

class Teams {
  int? id;
  String? teamName;
  bool? isLeader;
  String? firstMemberName;
  String? secondMemberName;
  String? thirdMemberName;
  String? fourthMemberName;
  String? fifthMemberName;

  Teams(
      {this.id,
      this.teamName,
      this.isLeader,
      this.firstMemberName,
      this.secondMemberName,
      this.thirdMemberName,
      this.fourthMemberName,
      this.fifthMemberName});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    isLeader = json['is_leader'];
    firstMemberName = json['first_member_name'];
    secondMemberName = json['second_member_name'];
    thirdMemberName = json['third_member_name'];
    fourthMemberName = json['fourth_member_name'];
    fifthMemberName = json['fifth_member_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['team_name'] = teamName;
    data['is_leader'] = isLeader;
    data['first_member_name'] = firstMemberName;
    data['second_member_name'] = secondMemberName;
    data['third_member_name'] = thirdMemberName;
    data['fourth_member_name'] = fourthMemberName;
    data['fifth_member_name'] = fifthMemberName;
    return data;
  }
}
