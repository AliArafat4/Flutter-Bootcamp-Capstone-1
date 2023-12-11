import 'package:bloc/bloc.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<SkillEvent>((event, emit) {
      emit(LoadingProfileState());
    });

    on<BioEvent>((event, emit) async {
      emit(LoadingProfileState());
      final bloc = await SupaBaseDB().getCurrentUser();
      try {
        if (event.bio.isNotEmpty) {
          final resultuploadData = await SupaBaseDB().addBioUser(
            bioUser: event.bio,
            nameUser: bloc.name,
            emailUser: bloc.email,
            uuidUser: bloc.userId,
            skill: [],
            role: "",
            isAdmin: bloc.isAdmin,
          );

          final UserModel user = UserModel.fromJson(resultuploadData[0]);

          if (resultuploadData != null && resultuploadData.isNotEmpty) {
            emit(SuccessState(dataUser: user));
          } else {
            emit(ErrorState(errormessage: 'The addition was not successful'));
          }
        } else {
          emit(ErrorState(errormessage: 'Please enter a bio'));
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
