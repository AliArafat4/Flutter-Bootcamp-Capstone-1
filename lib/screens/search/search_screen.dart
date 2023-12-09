import 'package:flutter/material.dart';
import 'package:team_hack/screens/auth/components/auth_text_field.dart';
import 'package:team_hack/screens/search/widget/search_filed.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const AuthTextField(
                  isPassword: false,
                  content: "Search by field",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 90,
                ),
                Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: listFiledName.length,
                        itemBuilder: (BuildContext context, index) {
                          return SearchField(
                              fieldName: listFiledName[index],
                              image: listFiledImage[index],
                              onTap: () {});
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
