import 'package:flutter/material.dart';

import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/notification_screen/notification_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_bloc.dart';
import 'package:team_hack/screens/navigationbar/navigation_bar_screen.dart';

import 'screens/start/start_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationBarScreen(),
      ),
    );

  }
}
