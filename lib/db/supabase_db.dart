import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
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
      return err;
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
    required String firstMemberName,
    required String secondMemberName,
    required String thirdMemberName,
    required int hackId,
  }) async {
    try {
      final client = Supabase.instance.client;
//TODO fix
      final team = await client
          .from("teams")
          .insert({
            "team_name": teamName,
            "first_member_name": firstMemberName,
            "second_member_name": secondMemberName,
            "third_member_name": thirdMemberName,
            "fourth_member_name": "",
            "fifth_member_name": "",
            "is_leader": true
          })
          .select()
          .then((value) async => await client
              .from("regirtered_team")
              .insert({"kack_id": hackId, "team_id": value.first["id"]}));
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
    required List<String> skill,
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
            "skills": [],
            "role": "",
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

  addRoleUser(
      {required String nameUser,
      required String roleUser,
      required String emailUser,
      required String uuidUser}) async {
    try {
      final client = Supabase.instance.client;
      final user = await client.from("users").update({
        "name": nameUser,
        "email": emailUser,
        "user_id": uuidUser,
        "role": roleUser
      });
      return true;
    } catch (err) {
      print(err);
    }
  }

  addSkillUser(
      {required List<String> skill,
      required String nameUser,
      required String emailUser,
      required String uuidUser}) async {
    try {
      final client = Supabase.instance.client;
      final bioUser = await client.from("users").update({
        "name": nameUser,
        "email": emailUser,
        "user_id": uuidUser,
        "skills": skill,
      });
      return true;
    } catch (err) {
      print(err);
    }
  }

  Future<List<TeamModel>> getAllTeam(int id) async {
    print(id);
    final client = Supabase.instance.client;
    final teams = await client
        .from("registered_team")
        .select(" teams(*) ")
        .eq("hack_id", id);
    print(teams);
    final List<TeamModel> allTeams = [];
    for (var element in teams) {
      allTeams.add(TeamModel.fromJson(element["teams"]));
    }
    print("objects");
    return allTeams;
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

  
}
