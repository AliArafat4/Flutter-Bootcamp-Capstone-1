import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_bloc.dart';
import 'db/supabase_db.dart';
import 'screens/navigationbar/navigation_bar_screen.dart';
import 'screens/start/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupaBaseDB().initializeSupa();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SupaBaseDB().isTokenExpired() ? const StartScreen() : const NavigationBarScreen(),
      ),
    );
  }
}
