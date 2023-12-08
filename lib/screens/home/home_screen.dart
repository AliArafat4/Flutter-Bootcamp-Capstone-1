import 'package:flutter/material.dart';
import 'package:team_hack/screens/add_hackathon/add_hackathon_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'TeamHack',
                            style: TextStyle(fontSize: 25),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 65),
                            child: Text('fun things to discover'),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddHackathonScreen()),
                          );
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 7,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Container(
                            color: const Color.fromARGB(255, 196, 222, 197),
                            child: const TabBar(
                              isScrollable: true,
                              labelColor: Colors.black,
                              indicatorColor: Color.fromARGB(173, 244, 67, 54),
                              tabs: [
                                Tab(text: 'Design'),
                                Tab(text: 'Programming'),
                                Tab(text: 'Business analysis'),
                                Tab(text: 'Data analysis'),
                                Tab(text: 'Information security'),
                                Tab(text: 'Networking'),
                                Tab(text: 'All'),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: TabBarView(
                                children: [
                                  ListView.builder(
                                      //shrinkWrap: true,
                                      itemCount: 4, //change it later
                                      itemBuilder: (BuildContext context, index) {
                                        return Stack(
                                          alignment: FractionalOffset.bottomCenter,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: Image.asset(
                                                "assets/images/hackImage.png",
                                              ),
                                            ),
                                            Container(
                                              height: 50.0,
                                              color: const Color.fromARGB(237, 166, 28, 28),
                                              child: const Padding(
                                                padding: EdgeInsets.only(left: 10, top: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        'Hackathon Name',
                                                        style: TextStyle(
                                                            color: Colors.white, fontSize: 18),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Riyadh,',
                                                            style: TextStyle(color: Colors.white),
                                                          ),
                                                          Text(
                                                            '01/08/2023',
                                                            style: TextStyle(color: Colors.white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),

                                  const Center(
                                      child: Text(
                                    'Tab Programming',
                                    style: TextStyle(color: Colors.red),
                                  )),

                                  // Content of Tab 3
                                  const Center(child: Text('Tab Business analysis')),
                                  const Center(child: Text('Tab Data analysis')),
                                  const Center(child: Text('Tab Information security')),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
