import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/bloc_search/search_bloc.dart';
import 'package:team_hack/data/global.dart';
import 'package:team_hack/screens/auth/components/auth_text_field.dart';
import 'package:team_hack/screens/search/widget/search_filed.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController conTextSearch = TextEditingController();
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
              child: Column(children: [
                AuthTextField(
                  controller: conTextSearch,
                  isPassword: false,
                  content: "Search by field",
                  onChangeFunc: (query) {
                    context.read<SearchBloc>().add(
                          SearchEvent(textSearch: query),
                        );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 90,
                ),

                // if (state is ErrorState) {
                //   showErrorSnackBar(context, state.errorText);
                // }

                Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: searchResults.length,
                        itemBuilder: (BuildContext context, index) {
                          final key = searchResults[index];
                          final value = listSearch[key];

                          BlocBuilder<SearchBloc, SearchState>(
                            builder: (context, state) {
                              return SearchField(
                                  fieldName: key, image: value!, onTap: () {});
                            },
                          );
                          return null;
                        })),
              ])),
        ),
      ),
    );
  }
}
