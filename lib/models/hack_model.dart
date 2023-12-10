class HackModel {
  String? name;
  int? teamSize;
  int? numberOfTeams;
  String? starRegDate;
  String? endRegDate;
  String? hackStartDate;
  String? hackEndDate;
  String? field;
  String? description;
  String? location;

  HackModel({
    required this.name,
    required this.teamSize,
    required this.numberOfTeams,
    required this.starRegDate,
    required this.endRegDate,
    required this.hackStartDate,
    required this.hackEndDate,
    required this.field,
    required this.description,
    required this.location,
  });

  HackModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    teamSize = json['team_size'];
    numberOfTeams = json['number_of_teams'];
    starRegDate = json['start_date_register'];
    endRegDate = json['end_date_register'];
    hackStartDate = json['start_date_hack'];
    hackEndDate = json['end_date_hack'];
    field = json['field'];
    description = json['description'];
    location = json['location'];
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
