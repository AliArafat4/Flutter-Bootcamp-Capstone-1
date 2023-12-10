import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_hack/models/hack_model.dart';
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
      final hacks = await client.from("hackathons").select(field);
      final List<HackModel> hacksList = [];
      for (var item in hacks) {
        hacksList.add(HackModel.fromJson(item));
      }

      return hacksList;
    } on PostgrestException catch (err) {
      return err.message;
    }
  }
}
