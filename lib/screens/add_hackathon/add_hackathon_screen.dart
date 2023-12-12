import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/add_hackathon_bloc/add_hackathon_cubit.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/bloc/map_bloc/map_bloc.dart';
import 'package:team_hack/method/show_dilog.dart';
import 'package:team_hack/screens/add_hackathon/components/google_maps.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_dropdown.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_textfield_date.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/screens/home/home_screen.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

import '../auth/components/show_snack_bar.dart';

class AddHackathonScreen extends StatelessWidget {
  AddHackathonScreen({super.key});

  final List<String> listField = <String>[
    'Design',
    'Programming',
    'Business analysis',
    'Data analysis',
    'Information security',
    'Networking'
  ];
  final List<String> listNumTeam = <String>['2', '3', '4', '5'];
  final TextEditingController conStartDateRegister = TextEditingController();
  final TextEditingController conEndDateRegister = TextEditingController();
  final TextEditingController conStartDatehack = TextEditingController();
  final TextEditingController conEndDatehack = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController hackDetailsController = TextEditingController();
  final TextEditingController numberOfTeamsController = TextEditingController();
  String selected = "Online";
  String hackField = "Design";
  String numberOfTeamMembers = "2";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Hackathon"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CreateHackathonTextFiled(
                    isDisabled: false,
                    content: 'Enter Hackathon Name',
                    controller: nameController,
                  ),
                  BlocBuilder<AddHackathonCubit, AddHackathonState>(
                    buildWhen: (previous, current) =>
                        current is AddHackathonRadioState,
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "Online",
                                  groupValue: state is AddHackathonRadioState
                                      ? state.type
                                      : selected,
                                  onChanged: (value) {
                                    context
                                        .read<AddHackathonCubit>()
                                        .changeRadioCubit(selectedType: value!);
                                    selected = value;
                                    locationController.text = "";
                                  }),
                              const Text("Online"),
                              Radio(
                                  value: "On Person",
                                  groupValue: state is AddHackathonRadioState
                                      ? state.type
                                      : selected,
                                  onChanged: (value) {
                                    context
                                        .read<AddHackathonCubit>()
                                        .changeRadioCubit(selectedType: value!);
                                    selected = value;
                                  }),
                              const Text("On Person"),
                            ],
                          ),
                          Visibility(
                            visible: state is AddHackathonRadioState
                                ? state.type == "Online"
                                    ? false
                                    : true
                                : false,
                            child: BlocConsumer<MapBloc, MapState>(
                              builder: (context, state) {
                                return CreateHackathonTextFiled(
                                  content: 'Location',
                                  controller: locationController,
                                  isDisabled: true,
                                  maxLines: 4,
                                  onTapFunc: () async {
                                    final isAllowed = await userPermission();
                                    if (isAllowed) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const GoogleMapScreen()));
                                    }
                                  },
                                  iconButton: const IconButton(
                                    onPressed: null,
                                    disabledColor: Colors.grey,
                                    icon: Icon(Icons.location_on_outlined),
                                  ),
                                );
                              },
                              listener: (BuildContext context, MapState state) {
                                state is MapGetMarkerLocationState
                                    ? locationController.text = state.location
                                    : const SizedBox();
                                state is MapGetCurrentLocationState
                                    ? const SizedBox()
                                    : context
                                        .read<MapBloc>()
                                        .add(MapGetCurrentLocationEvent());
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 42),
                  CreateHackathonTextFiled(
                    isDisabled: false,
                    isDetails: true,
                    content: 'Enter Hackathon Details',
                    controller: hackDetailsController,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 42),
                  CreateHackathonTextFiled(
                    isDisabled: false,
                    content: 'Enter The Number of Participating Teams',
                    controller: numberOfTeamsController,
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child:
                            BlocConsumer<AddHackathonCubit, AddHackathonState>(
                          buildWhen: (previous, current) =>
                              current is AddHackathonStartRegDateState,
                          builder: (context, state) {
                            return WidgetTextFieldDate(
                              selectDate: () async {
                                context
                                    .read<AddHackathonCubit>()
                                    .changeHackStartRegDate(context: context);
                              },
                              controllerDate: conStartDateRegister,
                              textFieldText: 'StartDate of Register',
                            );
                          },
                          listener:
                              (BuildContext context, AddHackathonState state) {
                            state is AddHackathonStartRegDateState
                                ? conStartDateRegister.text =
                                    state.startRegDate ?? ""
                                : const SizedBox();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        flex: 2,
                        child:
                            BlocConsumer<AddHackathonCubit, AddHackathonState>(
                          buildWhen: (previous, current) =>
                              current is AddHackathonEndRegDateState,
                          builder: (context, state) {
                            return WidgetTextFieldDate(
                              selectDate: () async {
                                context
                                    .read<AddHackathonCubit>()
                                    .changeHackEndRegDate(context: context);
                              },
                              controllerDate: conEndDateRegister,
                              textFieldText: 'EndDate of Register',
                            );
                          },
                          listener:
                              (BuildContext context, AddHackathonState state) {
                            state is AddHackathonEndRegDateState
                                ? conEndDateRegister.text =
                                    state.endRegDate ?? ""
                                : const SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child:
                            BlocConsumer<AddHackathonCubit, AddHackathonState>(
                          buildWhen: (previous, current) =>
                              current is AddHackathonStartHackDateState,
                          builder: (context, state) {
                            return WidgetTextFieldDate(
                              selectDate: () async {
                                context
                                    .read<AddHackathonCubit>()
                                    .changeHackStartDate(context: context);
                              },
                              controllerDate: conStartDatehack,
                              textFieldText: 'StartDate of Hackathon',
                            );
                          },
                          listener:
                              (BuildContext context, AddHackathonState state) {
                            state is AddHackathonStartHackDateState
                                ? conStartDatehack.text =
                                    state.startHackDate ?? ""
                                : const SizedBox();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        flex: 2,
                        child:
                            BlocConsumer<AddHackathonCubit, AddHackathonState>(
                          buildWhen: (previous, current) =>
                              current is AddHackathonEndHackDateState,
                          builder: (context, state) {
                            return WidgetTextFieldDate(
                              selectDate: () async {
                                context
                                    .read<AddHackathonCubit>()
                                    .changeHackEndDate(context: context);
                              },
                              controllerDate: conEndDatehack,
                              textFieldText: 'EndDate of Hackathon',
                            );
                          },
                          listener:
                              (BuildContext context, AddHackathonState state) {
                            state is AddHackathonEndHackDateState
                                ? conEndDatehack.text = state.endHackDate ?? ""
                                : const SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<AddHackathonCubit, AddHackathonState>(
                    buildWhen: (previous, current) =>
                        current is AddHackathonFieldState,
                    builder: (context, state) {
                      return WidgetDropdownButton(
                        dropdownValue: hackField,
                        listString: listField,
                        labelDropdownButton: 'Hackathon Field:',
                        func: (value) {
                          context
                              .read<AddHackathonCubit>()
                              .changeFieldCubit(selectedField: value!);
                          hackField = value;
                        },
                      );
                    },
                  ),
                  BlocBuilder<AddHackathonCubit, AddHackathonState>(
                    buildWhen: (previous, current) =>
                        current is AddHackathonNumberOfTeamMembersState,
                    builder: (context, state) {
                      return WidgetDropdownButton(
                        listString: listNumTeam,
                        dropdownValue: numberOfTeamMembers,
                        labelDropdownButton: 'Number of team members:',
                        func: (value) {
                          context
                              .read<AddHackathonCubit>()
                              .changeTeamSizeCubit(size: value!);
                          numberOfTeamMembers = value;
                        },
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  BlocConsumer<HackCubit, HackState>(
                    listener: (context, state) {
                      state is AddHackSuccessState
                          ? showSuccessDiolg(
                              context: context,
                              successMessage: "Hackathon Added Successfully",
                              func: () {
                                Navigator.of(context).pop();
                              })
                          : const SizedBox();
                      state is AddHackErrorState
                          ? showSnackBar(
                              context: context, message: state.errMsg)
                          : const SizedBox();
                    },
                    builder: (context, state) {
                      return PrimaryButton(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 16,
                          title: "Add",
                          onPressed: () {
                            context.read<HackCubit>().addHackFunc(
                                name: nameController.text,
                                teamSize: numberOfTeamMembers,
                                numberOfTeams: numberOfTeamsController.text,
                                starRegDate: conStartDateRegister.text,
                                endRegDate: conEndDateRegister.text,
                                hackStartDate: conStartDatehack.text,
                                hackEndDate: conEndDatehack.text,
                                field: hackField,
                                description: hackDetailsController.text,
                                location: locationController.text.isEmpty
                                    ? selected
                                    : locationController.text);
                          });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
