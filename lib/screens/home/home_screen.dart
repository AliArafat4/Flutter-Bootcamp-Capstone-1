import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/models/hack_model.dart';
import 'package:team_hack/screens/add_hackathon/add_hackathon_screen.dart';
import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HackCubit>();
    bloc.state is HackInitial ? bloc.getAllHacksFunc() : const SizedBox();
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
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddHackathonScreen()),
                        );
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              BlocBuilder<HackCubit, HackState>(
                builder: (context, state) {
                  return Expanded(
                    child: DefaultTabController(
                      length: 7,
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
                            tabs: const [
                              Tab(text: 'All'),
                              Tab(text: 'Design'),
                              Tab(text: 'Programming'),
                              Tab(text: 'Business analysis'),
                              Tab(text: 'Data analysis'),
                              Tab(text: 'Information security'),
                              Tab(text: 'Networking'),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TabBarView(
                                children: [
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
                                  CustomHacksCards(state: state),
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

class CustomHacksCards extends StatelessWidget {
  const CustomHacksCards({
    super.key,
    required this.state,
  });
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return state is GetAllHacksState
        ? ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.hackModel.length,
            itemBuilder: (BuildContext context, index) {
              return state.hackModel.length > 0
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HackathonDetail(
                                    selectedHack: state.hackModel[index])));
                      },
                      child: HackathonCard(
                        hackathonName: "${state.hackModel[index].name}",
                        hackathonDate:
                            "${state.hackModel[index].hackStartDate} - ${state.hackModel[index].hackEndDate}",
                        hackathonLocation: "${state.hackModel[index].location}",
                        hackathonField: "${state.hackModel[index].field}",
                      ),
                    )
                  : const SizedBox();
            })
        : state is AddHackNoDataState
            ? const Center(child: Text("No Hackathons"))
            : const Center(child: CircularProgressIndicator());
  }
}
