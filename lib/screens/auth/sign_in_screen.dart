import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/create_team/create_team_screen.dart';
import 'package:team_hack/screens/navigationbar/navigation_bar_screen.dart';

import 'components/auth_button.dart';
import 'components/auth_text_field.dart';
import 'components/show_snack_bar.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: context.getHeight(factor: .1)),
          SizedBox(
            width: context.getWidth(factor: 0.64),
            child: const ListTile(
              title: Text(
                "TeamHack",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              subtitle: Text(
                "   Fun Things to Discover",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: context.getHeight(factor: .03)),
          const Center(
            child: Text(
              "Welcome Back",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ),
          SizedBox(height: context.getHeight(factor: .1)),
          AuthTextField(
            isPassword: false,
            controller: emailController,
            content: "Email",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: true,
            controller: passwordController,
            content: "Password",
          ),
          SizedBox(height: context.getHeight(factor: .03)),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state is AuthLoginErrorState
                  ? showSnackBar(context: context, message: state.errorMsg)
                  : const SizedBox();
              state is AuthLoginSuccessState
                  ? Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const NavigationBarScreen()))
                  : const SizedBox();
            },
            builder: (context, state) {
              return AuthButton(
                  content: "Sign In",
                  onPressedFunc: () {
                    context.read<AuthBloc>().add(AuthLoginEvent(
                        email: emailController.text, password: passwordController.text));
                  });
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => state is LoadingState
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(),
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
