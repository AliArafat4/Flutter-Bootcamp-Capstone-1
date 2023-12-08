import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/navigationbar/navigation_bar_screen.dart';
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
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 64, right: 162),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xff64a3fa)),
                  ),
                  Text(
                    "Create a new account",
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
            PrimaryButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 16,
              title: "Register",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationBarScreen()));
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

*/