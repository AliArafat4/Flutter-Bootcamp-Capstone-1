import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';

import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
            controller: emailController,
            content: "Name",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: false,
            controller: emailController,
            content: "Password",
          ),
          SizedBox(height: context.getHeight(factor: .02)),
          AuthTextField(
            isPassword: true,
            controller: passwordController,
            content: "Confirm Password",
          ),
          SizedBox(height: context.getHeight(factor: .03)),
          AuthButton(content: "Register", onPressedFunc: () {}),
        ],
      ),
    );
  }
}
