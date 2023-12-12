import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/bloc_search/search_bloc.dart';
import 'package:team_hack/screens/auth/components/auth_text_field.dart';
import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';
import 'package:team_hack/widgets/empty_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController textSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchBloc>();
    bloc.state is! SearchInitial
        ? bloc.add(SearchStateEvent(textSearch: ""))
        : SizedBox();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          leading: const SizedBox(),
          leadingWidth: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                AuthTextField(
                  controller: textSearch,
                  isPassword: false,
                  content: "Search by field",
                  onChangeFunc: (value) async {
                    context.read<SearchBloc>().add(
                          SearchStateEvent(textSearch: value),
                        );
                  },
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchInitial) {
                      return const SizedBox.shrink();
                    } else if (state is EmptyState) {
                      return const EmptyStateUI(
                        title: "No results found",
                        subTitle: "Sorry, there are no results for this search",
                        image: "assets/images/no_search_result.png",
                      );
                    } else if (state is SuccessState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          itemCount: bloc.haclist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ...bloc.haclist
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HackathonDetail(
                                                      selectedHack: e,
                                                    )),
                                          );
                                        },
                                        child: HackathonCard(
                                          hackathonName: e.name ?? "-----",
                                          hackathonLocation:
                                              e.location ?? "-----",
                                          hackathonDate:
                                              e.endRegDate ?? "------",
                                          hackathonField: e.field ?? "------",
                                        ),
                                      ),
                                    )
                                    .toList()
                              ],
                            );
                          },
                        ),
                      );
                    }
                    return const Text(" ");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
