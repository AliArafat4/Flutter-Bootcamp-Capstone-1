import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/chat/chat_screen.dart';
import 'package:team_hack/screens/create_team/create_team_screen.dart';

import 'components/auth_button.dart';
import 'components/auth_text_field.dart';

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
          SizedBox(height: MediaQuery.of(context).size.height * .1),
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
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          const Center(
            child: Text(
              "Welcome Back",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .1),
          AuthTextField(
            isPassword: false,
            controller: emailController,
            content: "Email",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          AuthTextField(
            isPassword: true,
            controller: passwordController,
            content: "Password",
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .03),
          AuthButton(
              content: "Sign In",
              onPressedFunc: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateTeamScreen()));
              }),
        ],
      ),
    );
  }
}
