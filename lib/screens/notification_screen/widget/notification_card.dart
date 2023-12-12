import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/request_bloc/request_cubit.dart';
import 'package:team_hack/bloc/request_bloc/request_cubit.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/requests_model.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/notification_screen/widget/second_button.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.requestModel,
    required this.state,
  });
  final RequestModel requestModel;
  final dynamic state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.secondary),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 16),
              child: InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: const Text('User Info'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                'Name: ${requestModel.users!.name!.isEmpty ? "No Name Available" : requestModel.users!.name!}'),
                            Text(
                                'Email: ${requestModel.users!.email!.isEmpty ? "No Email Available" : requestModel.users!.email!}'),
                            Text(
                                'Bio: ${requestModel.users!.bio!.isEmpty ? "No Bio Available" : requestModel.users!.bio!}'),
                            Text(
                                'Skills: ${requestModel.users!.skills!.isEmpty ? "No Skills Available" : requestModel.users!.skills!}'),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(dialogContext)
                                  .pop(); // Dismiss alert dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                    "${requestModel.users!.name!.toUpperCase()} has sent a request to join Your Team:\n\n${requestModel.teams!.teamName}"),
              ),
            ),
            const SizedBox(height: 22),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 18,
                    title: "Accept",
                    onPressed: () {
                      context.read<RequestCubit>().resolveRequest(
                          requestModel: requestModel, type: 'accept');

                      // SupaBaseDB().UpdateTeam(teamName: teamName, hackId: hackId)
                    },
                  ),
                  SecondButton(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 18,
                      title: "Decline",
                      onPressed: () {
                        context.read<RequestCubit>().resolveRequest(
                            requestModel: requestModel, type: 'decline');
                      },
                      textColor: Colors.red,
                      borderColor: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
