import 'package:flutter/material.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/screens/hackathon_detail_screen/hackathon_detail_screen.dart';
import 'package:team_hack/screens/home/widget/hackathon_card.dart';
import 'package:team_hack/widgets/empty_state.dart';

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
            ? const EmptyStateUI(
                title: "No hackathon",
                subTitle: "Sorry,there are no hackathon under this category",
                image: "assets/images/no_search_result.png")
            : const Center(child: CircularProgressIndicator());
  }
}
