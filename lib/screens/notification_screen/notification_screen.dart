import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/request_bloc/request_cubit.dart';
import 'package:team_hack/bloc/request_bloc/request_cubit.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/screens/auth/components/show_snack_bar.dart';
import 'package:team_hack/screens/notification_screen/widget/notification_card.dart';
import 'package:team_hack/widgets/empty_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RequestCubit>();
    bloc.state is! RequestGetDataState
        ? bloc.getAllRequests()
        : const SizedBox();
    bloc.state is RequestGetDataState
        ? bloc.getAllRequests()
        : const SizedBox();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<RequestCubit, RequestState>(
          builder: (context, state) {
            return state is RequestGetDataState
                ? state.requestModel.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.requestModel.length,
                        itemBuilder: (context, index) {
                          return NotificationCard(
                              state: state,
                              requestModel: state.requestModel[index]);
                        })
                    : const EmptyStateUI(
                        title: "No Notification",
                        subTitle: "Sorry,there are no notification yet",
                        image: "assets/images/no_search_result.png")
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          listener: (BuildContext context, RequestState state) {
            state is RequestSuccessState
                ? showSnackBar(context: context, message: state.msg)
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
