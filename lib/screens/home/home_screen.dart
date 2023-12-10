import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/screens/add_hackathon/add_hackathon_screen.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: DefaultTabController(
                  length: 7,
                  child: Column(
                    children: [
                      BlocBuilder<HackCubit, HackState>(
                        builder: (context, state) {
                          return TabBar(
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
                          );
                        },
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
// =======
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => AddHackathonScreen()),
//                           );
//                         },
//                         icon: const Icon(Icons.add))
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Expanded(
//                   child: DefaultTabController(
//                     length: 7,
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       child: Column(
//                         children: [
//                           Container(
//                             color: const Color.fromARGB(255, 196, 222, 197),
//                             child: const TabBar(
//                               isScrollable: true,
//                               labelColor: Colors.black,
//                               indicatorColor: Color.fromARGB(173, 244, 67, 54),
//                               tabs: [
//                                 Tab(text: 'Design'),
//                                 Tab(text: 'Programming'),
//                                 Tab(text: 'Business analysis'),
//                                 Tab(text: 'Data analysis'),
//                                 Tab(text: 'Information security'),
//                                 Tab(text: 'Networking'),
//                                 Tab(text: 'All'),
//                               ],
//                             ),
//                           ),
//                           Flexible(
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: TabBarView(
//                                 children: [
//                                   ListView.separated(
//                                       separatorBuilder: (context, index) =>
//                                           const SizedBox(
//                                             height: 22,
//                                           ),
//                                       itemCount: 4, //change it later
//                                       itemBuilder: (BuildContext context, index) {
//                                         return Stack(
//                                           alignment: FractionalOffset.bottomCenter,
//                                           children: [
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(50),
//                                               ),
//                                               child: Image.asset(
//                                                 "assets/images/hackImage.png",
//                                               ),
//                                             ),
//                                             Container(

//                                               height: 70,
//                                               color: const Color(0xff0477f4)
//                                                   .withOpacity(0.6),

//                                               child: const Padding(
//                                                 padding: EdgeInsets.only(left: 10, top: 5),
//                                                 child: Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Flexible(
//                                                       child: Text(
//                                                         'Hackathon Name',
//                                                         style: TextStyle(
//                                                             color: Colors.white, fontSize: 18),
//                                                       ),
//                                                     ),
//                                                     Flexible(
//                                                       child: Row(
//                                                         children: [
//                                                           Text(
//                                                             'Riyadh,',
//                                                             style: TextStyle(color: Colors.white),
//                                                           ),
//                                                           Text(
//                                                             '01/08/2023',
//                                                             style: TextStyle(color: Colors.white),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         );
//                                       }),
// >>>>>>> main

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
// =======
//                                   // Content of Tab 3
//                                   const Center(child: Text('Tab Business analysis')),
//                                   const Center(child: Text('Tab Data analysis')),
//                                   const Center(child: Text('Tab Information security')),
//                                   const Center(child: Text('Tab Networking')),
//                                   const Center(child: Text('Tab All')),
//                                 ],
//                               ),
//                             ),
// >>>>>>> main
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
