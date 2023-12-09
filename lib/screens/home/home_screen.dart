import 'package:flutter/material.dart';
import 'package:team_hack/screens/add_hackathon/add_hackathon_screen.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: DefaultTabController(
                  length: 7,
                  child: Column(
                    children: [
                      const TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelColor: Color(0xff62c1c7),
                        indicatorColor: Color(0xff62c1c7),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
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
                              ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 16,
                                      ),
                                  itemCount: 4, //change it later
                                  itemBuilder: (BuildContext context, index) {
                                    return const HackathonCard(
                                      hackathonName: "AI Creation Hackathon",
                                      hackathonDate: "02/02/2024 - 08/02/2024",
                                      hackathonLocation: "Riyadh",
                                    );
                                  }),

                              const Center(
                                  child: Text(
                                'Tab Programming',
                                style: TextStyle(color: Colors.red),
                              )),

                              // Content of Tab 3
                              const Center(
                                  child: Text('Tab Business analysis')),
                              const Center(child: Text('Tab Data analysis')),
                              const Center(
                                  child: Text('Tab Information security')),
                              const Center(child: Text('Tab Networking')),
                              const Center(child: Text('Tab All')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
