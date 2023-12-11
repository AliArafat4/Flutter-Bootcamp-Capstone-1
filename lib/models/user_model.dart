class UserModel {
  String? userId;
  String? email;
  String? role;
  String? name;
  String? bio;
  List? skills;
  bool? isAdmin;


  UserModel(
      {this.userId,
      this.email,
      this.role,
      this.name,
      this.bio,
      this.skills,
      this.isAdmin});



  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    role = json['role'];
    name = json['name'];
    bio = json['bio'];
    skills = json['skills'];
    isAdmin = json['is_admin'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['id'] = id;
//   data['email'] = email;
//   data['time'] = time;
//   data['name'] = name;
//   data['course_name'] = courseName;
//   return data;
// }
}
