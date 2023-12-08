import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/home/home_screen.dart';
import 'components/auth_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.getHeight(factor: .1)),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 64, right: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xff64a3fa)),
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
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
            PrimaryButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 16,
              title: "Login",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              color: const Color(0xff64a3fa),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
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
          AuthButton(
              content: "Sign In",
              onPressedFunc: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTeamScreen()));
              }),
        ],
      ),
    );
  }
}
*/