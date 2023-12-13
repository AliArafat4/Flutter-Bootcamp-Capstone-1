import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/models/requests_model.dart';
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

  Future<dynamic> getUserInfo({
    required String? userID1,
    required String? userID2,
    required String? userID3,
    required String? userID4,
  }) async {
    try {
      final client = Supabase.instance.client;
      late final user;
      if (userID2 == null) {
        user = await client.from("users").select().in_('user_id', [
          userID1,
        ]);
      } else if (userID3 == null) {
        user = await client.from("users").select().in_('user_id', [
          userID1,
          userID2,
        ]);
      } else if (userID4 == null) {
        user = await client.from("users").select().in_('user_id', [
          userID1,
          userID2,
          userID3,
        ]);
      } else {
        user = await client.from("users").select().in_('user_id', [
          userID1,
          userID2,
          userID3,
          userID4,
        ]);
      }

      final List<UserModel> usersList = [];
      for (var users in user) {
        usersList.add(UserModel.fromJson(users));
      }

      return usersList;
    } catch (err) {
      print(err);
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

      return user;
    } catch (err) {
      print(err);
    }
  }

  addRoleUser(
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

      return user;
    } catch (err) {
      print(err);
    }
  }

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
    try {
      final client = Supabase.instance.client;
      final teams = await client
          .from("registered_team")
          .select(" teams(*) ")
          .eq("hack_id", id);

      final List<TeamModel> allTeams = [];

      for (var element in teams) {
        final List<UserModel> list = await getUserInfo(
            userID1: element["teams"]['first_member_name'],
            userID2: element["teams"]['second_member_name'],
            userID3: element["teams"]['third_member_name'],
            userID4: element["teams"]['fourth_member_name']);

        if (list.length == 4) {
          allTeams.add(TeamModel.fromJson(element["teams"],
              user1: list[0], user2: list[1], user3: list[2], user4: list[3]));
        } else if (list.length == 3) {
          allTeams.add(TeamModel.fromJson(element["teams"],
              user1: list[0], user2: list[1], user3: list[2]));
        } else if (list.length == 2) {
          allTeams.add(TeamModel.fromJson(element["teams"],
              user1: list[0], user2: list[1]));
        } else if (list.length == 1) {
          allTeams.add(TeamModel.fromJson(element["teams"], user1: list[0]));
        }
      }

      return allTeams;
    } catch (err) {
      final List<TeamModel> allTeams = [];
      print(err);
      return allTeams;
    }
  }

  Future<List<HackModel>> getHackathon({required String hackName}) async {
    final supabase = Supabase.instance.client;
    final client = await supabase
        .from("hackathons")
        .select("*")
        .ilikeAnyOf("name", ["%$hackName%"]);
    List<HackModel> hackathonList = [];
    for (var element in client) {
      hackathonList.add(HackModel.fromJson(element));
    }

    return hackathonList;
  }

  sendRequest({required int teamID}) async {
    //TODO: CHECK IF USER IN TEAM
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
          .eq("request_from", client.auth.currentUser!.id);
      if (checkIfLeader.first["teams"]["first_member_name"] ==
          client.auth.currentUser!.id) {
        return "You are the Leader on This Team";
      } else if (checkIfRequested.isNotEmpty) {
        return "You Have Requested to Join This Team";
      } else if (checkIfLeader.first["teams"]["fourth_member_name"] != null) {
        return "Team Is Full";
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
          .select("*,users!request_request_from_fkey(*),teams(*) ")
          .eq("request_to", client.auth.currentUser!.id);

      final List<RequestModel> requestModel = [];

      for (var request in requests) {
        requestModel.add(RequestModel.fromJson(request));
      }

      return requestModel;
    } catch (err) {
      print(err);
    }
  }

  resolveRequest({
    required String userID,
    required String updatedColumn,
    required int teamID,
    required int requestID,
    required String type,
  }) async {
    try {
      final client = Supabase.instance.client;
      if (type.toLowerCase() == "accept") {
        final requests = await client
            .from("teams")
            .update({
              updatedColumn: userID,
            })
            .eq("id", teamID)
            .then((value) async =>
                await client.from("request").delete().match({'id': requestID}));
      } else if (type.toLowerCase() == "decline") {
        await client.from("request").delete().match({'id': requestID});
      }
    } catch (err) {
      print(err);
    }
  }
}
