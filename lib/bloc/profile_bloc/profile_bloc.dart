import 'package:bloc/bloc.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<SkillEvent>((event, emit) async {
      emit(LoadingSkillState());

      final UserModel bloc = await SupaBaseDB().getCurrentUser();
      print(bloc.skills);
      List listSkill = bloc.skills!;
      try {
        if (event.skill.isNotEmpty) {
          listSkill.add(event.skill);

          var resultuploadData = await SupaBaseDB().addSkillUser(
            bioUser: bloc.bio!,
            nameUser: bloc.name!,
            emailUser: bloc.email!,
            uuidUser: bloc.userId!,
            skill: listSkill,
            role: bloc.role!,
            isAdmin: bloc.isAdmin!,
          );

          emit(SuccessSkillState(dataUser: resultuploadData));
        } else {
          emit(ErrorSkillState(errormessage: 'please enter skill'));
        }
      } catch (error) {
        throw Exception('Error is $error');
      }
    });

    on<BioEvent>((event, emit) async {
      emit(LoadingBioState());
      final bloc = await SupaBaseDB().getCurrentUser();
      try {
        if (event.bio.isNotEmpty) {
          final resultuploadData = await SupaBaseDB().addBioUser(
            bioUser: event.bio,
            nameUser: bloc.name,
            emailUser: bloc.email,
            uuidUser: bloc.userId,
            skill: bloc.skills,
            role: bloc.role,
            isAdmin: bloc.isAdmin,
          );

          final UserModel user = UserModel.fromJson(resultuploadData[0]);

          if (resultuploadData != null && resultuploadData.isNotEmpty) {
            emit(SuccessBioState(dataUser: user));
          }
        } else {
          emit(ErrorBioState(errormessage: 'Please enter a bio'));
        }
      } catch (error) {
        throw Exception('Error is $error');
      }
    });

    on<GetCurrentUserEvent>((event, emit) async {
      emit(GetCurrentUserState(user: await SupaBaseDB().getCurrentUser()));
    });
  }
}
