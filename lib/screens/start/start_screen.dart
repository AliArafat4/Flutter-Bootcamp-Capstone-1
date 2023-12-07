import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/auth/sign_in_screen.dart';
import 'package:team_hack/screens/auth/sign_up_screen.dart';

import 'components/start_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeight(factor: 0.04)),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Welcome To TeamHack",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
            const Spacer(),
            Center(
                child: StartButton(
                    content: "Login",
                    onPressedFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    })),
            SizedBox(height: context.getHeight(factor: 0.02)),
            Center(
                child: StartButton(
                    content: "Register",
                    onPressedFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    })),
            SizedBox(height: context.getHeight(factor: 0.1)),
          ],
        ),
      ),
    );
  }
}
