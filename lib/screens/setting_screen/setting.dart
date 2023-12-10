import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/theme_bloc/them_bloc.dart';
import 'package:team_hack/bloc/theme_bloc/them_event.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/local_storage/shared_prefrences.dart';
import 'package:team_hack/main.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/hackathon_info.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/start/start_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const HackathonInfo(
                  icon: Icons.dark_mode,
                  title: "Dark mood",
                ),
                const Spacer(),
                Switch(
                  trackOutlineColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xff62c1c7),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = !isSwitched;
                    });
                    isSwitched
                        ? context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: "dark"))
                        : context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: "light"));
                  },
                ),
              ],
            ),
            const Spacer(),
            PrimaryButton(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                color: Colors.red.withOpacity(0.8),
                title: "Sign out",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartScreen()),
                  );
                }),
            SizedBox(height: context.getHeight(factor: 0.05)),
          ],
        ),
      ),
    );
  }
}
