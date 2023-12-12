import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/models/team_model.dart';
import 'package:team_hack/models/user_model.dart';

class SupaBaseDB {
  late final SupabaseClient supaBaseInstance;

  initializeSupa() async {
    await Supabase.initialize(
      url: dotenv.env['SupaURL']!,
      anonKey: dotenv.env['SupaKEY']!,
    );
  }

  bool isTokenExpired() {
    return Supabase.instance.client.auth.currentSession?.isExpired ?? true;
  }

  signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  login({required String email, required String password}) async {
    try {
      supaBaseInstance = Supabase.instance.client;

      final currentUser = await supaBaseInstance.auth
          .signInWithPassword(email: email, password: password);

      return "ok";
    } catch (err) {
      return err.toString();
    }
  }

  signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      supaBaseInstance = Supabase.instance.client;

      await supaBaseInstance.auth
          .signUp(
            email: email,
            password: password,
          )
          .then((value) async => await supaBaseInstance.from("users").upsert(
                {
                  "user_id": supaBaseInstance.auth.currentUser!.id,
                  "email": supaBaseInstance.auth.currentUser!.email,
                  "role": "",
                  "name": name,
                  "bio": "",
                  "skills": [],
                  'is_admin': false,
                },
              ));

      return "ok";
    } on PostgrestException catch (err) {
      return err.message.toString();
    } catch (err) {
      return err.toString();
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      final client = Supabase.instance.client;
      final user = await client
          .from("users")
          .select()
          .eq('user_id', client.auth.currentUser!.id);
      final userInfo = UserModel.fromJson(user.first);

      return userInfo;
    } catch (err) {
      print(err);
      return err;
    }
  }

  Future<dynamic> getUserInfo({required String? userID}) async {
    try {
      final client = Supabase.instance.client;
      final user = await client.from("users").select().eq('user_id', userID);
      final userInfo = UserModel.fromJson(user.first);
      return userInfo;
    } catch (err) {
      UserModel errUser = UserModel();
      return errUser;
    }
  }

  addHack({
    required String name,
    required int teamSize,
    required int numberOfTeams,
    required String starRegDate,
    required String endRegDate,
    required String hackStartDate,
    required String hackEndDate,
    required String field,
    required String description,
    required String location,
  }) async {
    try {
      final client = Supabase.instance.client;
      final hack = await client.from("hackathons").insert({
        "name": name,
        "team_size": teamSize,
        "number_of_teams": numberOfTeams,
        "start_date_register": starRegDate,
        "end_date_register": endRegDate,
        "start_date_hack": hackStartDate,
        "end_date_hack": hackEndDate,
        "field": field,
        "description": description,
        "location": location,
      });
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  getAllHack({String field = "*"}) async {
    try {
      final client = Supabase.instance.client;
      await Future.delayed(const Duration(seconds: 1));
      late final hacks;

      if (field.contains("*")) {
        hacks = await client.from("hackathons").select(field);
      } else {
        hacks = await client.from("hackathons").select("*").eq("field", field);
      }

      final List<HackModel> hacksList = [];
      for (var item in hacks) {
        hacksList.add(HackModel.fromJson(item));
      }

      return hacksList;
    } on PostgrestException catch (err) {
      return err.message;
    }
  }

  addNewTeam({
    required String teamName,
    // required String firstMemberName,
    // required String secondMemberName,
    // required String thirdMemberName,
    required int hackId,
  }) async {
    try {
      final client = Supabase.instance.client;
      print(teamName);
      print(client.auth.currentUser!.id);

      final team = await client
          .from("teams")
          .insert({
            "team_name": teamName,
            "first_member_name": client.auth.currentUser!.id,
            // "second_member_name": , //secondMemberName,
            // "third_member_name": , //thirdMemberName,
            // "fourth_member_name": ,
            // "fifth_member_name": ,
            "is_leader": true
          })
          .select()
          .then((value) async => await client
              .from("registered_team")
              .insert({"hack_id": hackId, "team_id": value.first["id"]}));
      return true;
    } catch (error) {
      print(error);

      return false;
    }
  }

  addBioUser({
    required String bioUser,
    required String nameUser,
    required String uuidUser,
    required String emailUser,
    required List skill,
    required String role,
    required bool isAdmin,
  }) async {
    try {
      final client = Supabase.instance.client;
      final user = await client
          .from("users")
          .update({
            "name": nameUser,
            "bio": bioUser,
            "email": client.auth.currentUser!.email,
            "user_id": client.auth.currentUser!.id,
            "skills": skill,
            "role": role,
            "is_admin": isAdmin,
          })
          .eq("user_id", client.auth.currentUser!.id)
          .select();
      print(user);
      return user;
    } catch (err) {
      print(err);
    }
  }

  // addRoleUser(
  //     {required String nameUser,
  //     required String roleUser,
  //     required String emailUser,
  //     required String uuidUser}) async {
  //   try {
  //     final client = Supabase.instance.client;
  //     final user = await client.from("users").update({
  //       "name": nameUser,
  //       "email": emailUser,
  //       "user_id": uuidUser,
  //       "role": roleUser
  //     });
  //     return true;
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  addSkillUser(
      {required String bioUser,
      required String role,
      required List skill,
      required String nameUser,
      required String emailUser,
      required bool isAdmin,
      required String uuidUser}) async {
    try {
      final client = Supabase.instance.client;
      final user = await client
          .from("users")
          .update({
            "bio": bioUser,
            "email": client.auth.currentUser!.email,
            "user_id": client.auth.currentUser!.id,
            "role": role,
            "is_admin": isAdmin,
            "name": nameUser,
            "skills": skill,
          })
          .eq("user_id", client.auth.currentUser!.id)
          .select();

      final UserModel userSkill = UserModel.fromJson(user[0]);

      return userSkill;
    } catch (err) {
      print(err);
    }
  }

  Future<List<TeamModel>> getAllTeam(int id) async {
    final client = Supabase.instance.client;
    final teams = await client
        .from("registered_team")
        .select(" teams(*) ")
        .eq("hack_id", id);

    final List<TeamModel> allTeams = [];

    for (var element in teams) {
      allTeams.add(TeamModel.fromJson(element["teams"]));
    }
    for (int i = 0; i < allTeams.length; i++) {
      allTeams[i].firstMemberModel =
          await getUserInfo(userID: teams[i]["teams"]['first_member_name']);
      allTeams[i].secondMemberModel =
          await getUserInfo(userID: teams[i]["teams"]['second_member_name']);
      allTeams[i].thirdMemberModel =
          await getUserInfo(userID: teams[i]["teams"]['third_member_name']);
      allTeams[i].fourthMemberModel =
          await getUserInfo(userID: teams[i]["teams"]['fourth_member_name']);
      allTeams[i].fifthMemberModel =
          await getUserInfo(userID: teams[i]["teams"]['fifth_member_name']);
    }
    return allTeams;
  }

  sendRequest({required int teamID}) async {
    try {
      final client = Supabase.instance.client;
      final checkIfLeader = await client
          .from("registered_team")
          .select("teams(*)")
          .eq("team_id", teamID);

      final checkIfRequested = await client
          .from("request")
          .select("*")
          .eq("team_name", teamID)
          .eq("user_id", client.auth.currentUser!.id);

      if (checkIfLeader.first["teams"]["first_member_name"] ==
          client.auth.currentUser!.id) {
        return "you are the leader";
      } else if (checkIfRequested.isNotEmpty) {
        return "You requested already";
      } else {
        final request = await client.from("request").upsert({
          "team_name": teamID,
          "request_from": client.auth.currentUser!.id,
          "request_to": checkIfLeader.first["teams"]["first_member_name"],
        });
        return "Request Sent Successfully";
      }
    } catch (err) {
      print(err);
      return err;
    }
  }

  getNotifications() async {
    try {
      final client = Supabase.instance.client;

      final requests = await client
          .from("request")
          .select("*,users!request_request_from_fkey(*) ")
          .eq("request_to", client.auth.currentUser!.id);
      print(requests[0]["users"]);

      //to get teams name from request
      final teamToJoin = [];
      final teamsName = [];
      for (int i = 0; i < requests.length; i++) {
        teamToJoin.add(await client
            .from("teams")
            .select("team_name")
            .eq("id", requests[i]["team_name"]));
        teamsName.add(teamToJoin[i][0]);
      }
      print(teamsName);
      //to get users name from request
      final requestFrom = [];
      final requestFromName = [];
      for (int i = 0; i < requests.length; i++) {
        requestFrom.add(await client
            .from("users")
            .select("*")
            .eq("user_id", requests[i]["request_from"]));
        requestFromName.add(requestFrom[i][0]);
      }
      print(requestFromName);
    } catch (err) {
      print(err);
    }
  }
}
