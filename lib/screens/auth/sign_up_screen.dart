import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';


import 'components/auth_button.dart';
import 'components/auth_text_field.dart';
import 'components/show_snack_bar.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
          SizedBox(height: context.getHeight(factor: .05)),
          const Center(
            child: Text(
              "Register a New Account",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
            ),
          ),
          SizedBox(height: context.getHeight(factor: .07)),
          AuthTextField(
            isPassword: false,
            controller: emailController,
            content: "Email",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: false,
            controller: nameController,
            content: "Name",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: true,
            controller: passwordController,
            content: "Password",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: true,
            controller: confirmPasswordController,
            content: "Confirm Password",
          ),
          SizedBox(height: context.getHeight(factor: .03)),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state is AuthRegisterErrorState
                  ? showSnackBar(context: context, message: state.errorMsg)
                  : const SizedBox();
              state is AuthRegisterSuccessState
                  ? Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
                      (route) => false,
                    )
                  : const SizedBox();
            },
            builder: (context, state) {
              return  PrimaryButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 16,
              title: "Register",
              color: const Color(0xff64a3fa),
              textColor: Colors.white,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthRegisterEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              userName: nameController.text,
                              confirmPassword: confirmPasswordController.text),
                        );
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

