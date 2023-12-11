import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_bloc.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_event.dart';
import 'package:team_hack/bloc/bloc_navigationbar/navigationbar_state.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/screens/home/home_screen.dart';
import 'package:team_hack/screens/notification_screen/notification_screen.dart';
import 'package:team_hack/screens/profile/profile_screen.dart';
import 'package:team_hack/screens/search/search_screen.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final pages = [
          const HomeScreen(),
          SearchScreen(),
          const NotificationScreen(),
          ProfileScreen()
        ];
        int currentIndex =
            state is NavigationInitialState ? state.indexPage : 0;
        return Scaffold(
          extendBody: true,
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xff62c1c7),
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              context
                  .read<NavigationBloc>()
                  .add(ClickNavigationEvent(clickIndex: index));
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.house_outlined,
                    size: 20,
                    color: currentIndex == 0
                        ? const Color(0xff62c1c7)
                        : Colors.grey,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: currentIndex == 1
                        ? const Color(0xff62c1c7)
                        : Colors.grey,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    size: 20,
                    color: currentIndex == 2
                        ? const Color(0xff62c1c7)
                        : Colors.grey,
                  ),
                  label: 'Notification'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                  size: 20,
                  color:
                      currentIndex == 3 ? const Color(0xff62c1c7) : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
