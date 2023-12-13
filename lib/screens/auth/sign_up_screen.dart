import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/method/alert_snackbar.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/navigationbar/navigation_bar_screen.dart';
import 'components/auth_text_field.dart';
import 'components/show_snack_bar.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeight(factor: .1)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Color(0xff62c1c7)),
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
            const SizedBox(
              height: 32,
            ),
            AuthTextField(
              isPassword: false,
              controller: emailController,
              content: "Email",
            ),
            AuthTextField(
              isPassword: false,
              controller: nameController,
              content: "Name",
            ),
            AuthTextField(
              isPassword: true,
              controller: passwordController,
              content: "Password",
            ),
            AuthTextField(
              isPassword: true,
              controller: confirmPasswordController,
              content: "Confirm Password",
            ),
            SizedBox(height: context.getHeight(factor: .03)),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                state is AuthRegisterErrorState
                    ? showErrorSnackBar(context, state.errorMsg)
                    : const SizedBox();
                state is AuthRegisterSuccessState
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavigationBarScreen()),
                        (route) => false,
                      )
                    : const SizedBox();
              },
              builder: (context, state) {
                return PrimaryButton(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 16,
                    title: "Register",
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthRegisterEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                userName: nameController.text,
                                confirmPassword:
                                    confirmPasswordController.text),
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
      ),
    );
  }
}
