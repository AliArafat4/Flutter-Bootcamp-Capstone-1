
import 'package:flutter/material.dart';
import 'package:team_hack/widgets/widget_textfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: WidgetTextField(
                    textFieldText: 'Search by field',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            color: const Color.fromARGB(93, 197, 38, 38),
                            child: Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            "assets/images/hackImage.png",
                                          ))),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40.0,
                                  color:
                                      const Color.fromARGB(90, 227, 218, 218),
                                  child: const Text(
                                    'Design field',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

