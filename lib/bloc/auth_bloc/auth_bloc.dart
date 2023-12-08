import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/extentions/email_validator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthRegisterEvent>((event, emit) async {
      emit(LoadingState());

      if (event.email.trim().isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Email"));
      } else if (!event.email.trim().isValidEmail()) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter a Valid Email"));
      } else if (event.password.isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Password"));
      } else if (event.password.length < 6) {
        emit(AuthRegisterErrorState(errorMsg: "Password Must be Greater Than 6 characters"));
      } else if (event.confirmPassword.isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Re-Enter your Password"));
      } else if (event.confirmPassword != event.password) {
        emit(AuthRegisterErrorState(errorMsg: "Password does not Match"));
      } else {
        final response = await SupaBaseDB()
            .signUp(email: event.email, password: event.password, name: event.userName);
        if (response.toString().toLowerCase() == "ok") {
          emit(AuthRegisterSuccessState());
        } else {
          emit(AuthRegisterErrorState(errorMsg: response.toString()));
        }
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(LoadingState());

      if (event.email.trim().isEmpty) {
        emit(AuthLoginErrorState(errorMsg: "Please Enter Your Email"));
      } else if (event.password.isEmpty) {
        emit(AuthLoginErrorState(errorMsg: "Please Enter Your Password"));
      } else {
        final response = await SupaBaseDB().login(email: event.email, password: event.password);
        if (response.toLowerCase() == "ok") {
          emit(AuthLoginSuccessState());
        } else {
          emit(AuthLoginErrorState(errorMsg: "Email or Password are incorrect"));
        }
      }
    });

  }
}
