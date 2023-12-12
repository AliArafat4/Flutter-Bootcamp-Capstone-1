import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';

showSuccessDiolg(
    {required BuildContext context,
    required String? successMessage,
    required Function() func}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: context.getHeight(factor: 0.01)),
              Flexible(
                child: Image.asset(
                  "assets/images/success_icon.png",
                  width: 180,
                ),
              ),
              SizedBox(height: context.getHeight(factor: 0.01)),
              Column(
                children: [
                  const Text(
                    "Success",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff07CC66),
                        fontWeight: FontWeight.w700),
                  ),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      successMessage!,
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  SizedBox(height: context.getHeight(factor: 0.01)),
                  PrimaryButton(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 18,
                      title: "Done",
                      onPressed: func)
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
