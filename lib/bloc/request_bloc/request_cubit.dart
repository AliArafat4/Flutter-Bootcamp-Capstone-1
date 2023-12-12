import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_hack/db/supabase_db.dart';
import 'package:team_hack/models/requests_model.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());

  getAllRequests() async {
    final reqModel = await SupaBaseDB().getNotifications();
    emit(RequestGetDataState(requestModel: reqModel));
  }

  resolveRequest(
      {required RequestModel requestModel, required String type}) async {
    emit(RequestInitial());

    if (requestModel.teams!.secondMemberName == null) {
      await SupaBaseDB().resolveRequest(
        userID: requestModel.users!.userId!,
        updatedColumn: "second_member_name",
        teamID: requestModel.teamName!,
        requestID: requestModel.id!,
        type: type,
      );
    } else if (requestModel.teams!.thirdMemberName == null) {
      await SupaBaseDB().resolveRequest(
        userID: requestModel.users!.userId!,
        updatedColumn: "third_member_name",
        teamID: requestModel.teamName!,
        requestID: requestModel.id!,
        type: type,
      );
    } else if (requestModel.teams!.fourthMemberName == null) {
      await SupaBaseDB().resolveRequest(
        userID: requestModel.users!.userId!,
        updatedColumn: "fourth_member_name",
        teamID: requestModel.teamName!,
        requestID: requestModel.id!,
        type: type,
      );
    } else if (requestModel.teams!.fifthMemberName == null) {
      await SupaBaseDB().resolveRequest(
        userID: requestModel.users!.userId!,
        updatedColumn: "fifth_member_name",
        teamID: requestModel.teamName!,
        requestID: requestModel.id!,
        type: type,
      );
    }
    emit(RequestSuccessState(
        msg: type == "accept"
            ? "You Accepted the Request Successfully"
            : "Request has been Declined Successfully"));
    getAllRequests();
  }
}
