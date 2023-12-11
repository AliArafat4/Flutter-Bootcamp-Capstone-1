import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/auth_bloc/auth_bloc.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';

import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/models/hack_model.dart';

import 'package:team_hack/screens/add_hackathon/add_hackathon_screen.dart';
import 'package:team_hack/screens/chat/chat_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/home/widget/custom_hack_card.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blocHack = context.read<HackCubit>();
    blocHack.state is HackInitial
        ? blocHack.getAllHacksFunc()
        : const SizedBox();
    blocHack.state is! HackInitial
        ? blocHack.getAllHacksFunc()
        : const SizedBox();
    final bloc = context.read<AuthBloc>();
    bloc.state is AuthInitial
        ? bloc.add(AuthGetCurrentUserEvent())
        : const SizedBox();

    const List<String> tabsTitle = [
      'All',
      'Design',
      'Programming',
      'Business analysis',
      'Data analysis',
      'Information security',
      'Networking'
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Discover Hackathons",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  BlocConsumer<AuthBloc, AuthState>(
                    buildWhen: (previous, current) =>
                        current is AuthGetCurrentUserState,
                    builder: (context, state) {
                      return state is AuthGetCurrentUserState
                          ? state.user.isAdmin ?? false
                              ? IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddHackathonScreen()),
                                    );
                                  },
                                  icon: const Icon(Icons.add))
                              : IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen()),
                                    );
                                  },
                                  icon: const Icon(Icons.chat))
                          : const SizedBox();
                    },
                    listener: (BuildContext context, AuthState state) {
                      state is AuthGetCurrentUserState
                          ? const SizedBox()
                          : context
                              .read<AuthBloc>()
                              .add(AuthGetCurrentUserEvent());
                    },
                  ),
                ],
              ),
              SizedBox(height: context.getHeight(factor: 0.028)),
              BlocBuilder<HackCubit, HackState>(
                builder: (context, state) {
                  return Expanded(
                    child: DefaultTabController(
                      length: tabsTitle.length,
                      child: Column(
                        children: [
                          TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            labelColor: const Color(0xff62c1c7),
                            indicatorColor: const Color(0xff62c1c7),
                            unselectedLabelColor: Colors.grey,
                            onTap: (value) {
                              if (value == 0) {
                                context.read<HackCubit>().getAllHacksFunc();
                              } else {
                                context
                                    .read<HackCubit>()
                                    .getAllHacksFunc(field: tabsTitle[value]);
                              }
                            },
                            tabs: [
                              ...List.generate(tabsTitle.length,
                                  (index) => Tab(text: tabsTitle[index]))
                            ],
                          ),
                          SizedBox(height: context.getHeight(factor: 0.028)),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TabBarView(
                                children: [
                                  ...List.generate(tabsTitle.length,
                                      (index) => CustomHacksCards(state: state))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
