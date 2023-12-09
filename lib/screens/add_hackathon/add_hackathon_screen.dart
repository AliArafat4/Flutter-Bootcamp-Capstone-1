import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:team_hack/bloc/hack_bloc/hack_cubit.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_dropdown.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_textfield_date.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';
import 'package:team_hack/widgets/create_hackathon_textfiled.dart';

import '../auth/components/show_snack_bar.dart';

class AddHackathonScreen extends StatelessWidget {
  AddHackathonScreen({super.key});

  List<String> listField = <String>[
    'Design',
    'Programming',
    'Business analysis',
    'Data analysis',
    'Information security',
    'Networking'
  ];
  List<String> listNumTeam = <String>['2', '3', '4', '5', '6'];
  TextEditingController conStartDateRegister = TextEditingController();
  TextEditingController conEndDateRegister = TextEditingController();
  TextEditingController conStartDatehack = TextEditingController();
  TextEditingController conEndDatehack = TextEditingController();

  DateTime? startDateRegister;
  DateTime? endDateRegister;
  DateTime? startDatehack;
  DateTime? endDatehack;

  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final DateTime _date = DateTime.now();
  selectStartDateRegister(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != null && date != _date) {
      // setState(() {
      //   _date = date;
      //   conStartDateRegister.text = _dateFormatter.format(date);

      //   // print(_date.toString());
      //   // print(conBirthday.text);
      // });
    }
    return date;
  }

  selectEndDateRegister(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != null && date != _date) {
      // setState(() {
      //   _date = date;
      //   conEndDateRegister.text = _dateFormatter.format(date);

      //   // print(_date.toString());
      //   // print(conBirthday.text);
      // });
    }
    return date;
  }

  selectStartDateHack(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != null && date != _date) {
      // setState(() {
      //   _date = date;
      //   conStartDatehack.text = _dateFormatter.format(date);

      //   // print(_date.toString());
      //   // print(conBirthday.text);
      // });
    }
    return date;
  }

  selectEndDateHack(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (date != null && date != _date) {
      // setState(() {
      //   _date = date;
      //   conEndDatehack.text = _dateFormatter.format(date);

      //   // print(_date.toString());
      //   // print(conBirthday.text);
      // });
    }
    return date;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController hackDetailsController = TextEditingController();
  final TextEditingController teamSizeController = TextEditingController();
  String hackField = "";
  String numberOfTeamMembers = "";

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
                    content: 'Enter Hackathon Name',
                    controller: nameController,
                  ),
                  CreateHackathonTextFiled(
                    content: 'Location',
                    controller: locationController,
                    isDisabled: false,
                    onTapFunc: () {
                      //TODO: OPEN GOOGLE MAPS
                    },
                    iconButton: const IconButton(
                      onPressed: null,
                      disabledColor: Colors.grey,
                      icon: Icon(Icons.location_on_outlined),
                    ),
                  ),
                  CreateHackathonTextFiled(
                    isDetails: true,
                    content: 'Enter Hackathon Details',
                    controller: hackDetailsController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 42,
                  ),
                  CreateHackathonTextFiled(
                    content: 'Enter Team Size',
                    controller: teamSizeController,
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: WidgetTextFieldDate(
                          selectDate: () async {
                            startDateRegister =
                                await selectStartDateRegister(context);
                          },
                          controllerDate: conStartDateRegister,
                          textfieldText: 'StartDate of Register',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: WidgetTextFieldDate(
                          selectDate: () async {
                            endDateRegister =
                                await selectEndDateRegister(context);
                          },
                          controllerDate: conEndDateRegister,
                          textfieldText: 'EndDate of Register',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: WidgetTextFieldDate(
                          selectDate: () async {
                            startDatehack = await selectStartDateHack(context);
                          },
                          controllerDate: conStartDatehack,
                          textfieldText: 'StartDate of Hackathon',
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: WidgetTextFieldDate(
                          selectDate: () async {
                            endDatehack = await selectEndDateHack(context);
                          },
                          controllerDate: conEndDatehack,
                          textfieldText: 'EndDate of Hackathon',
                        ),
                      ),
                    ],
                  ),
                  WidgetDropdownButton(
                    listString: listField,
                    labelDropdownButton: 'Hackathon Field:',
                    func: (value) {
                      hackField = value!;
                    },
                  ),
                  WidgetDropdownButton(
                    listString: listNumTeam,
                    labelDropdownButton: 'Number of team member:',
                    func: (value) {
                      numberOfTeamMembers = value!;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  BlocConsumer<HackCubit, HackState>(
                    listener: (context, state) {
                      state is AddHackSuccessState
                          ? showSnackBar(
                              context: context,
                              message: "Hackathon Added Successfully")
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
                                teamSize: teamSizeController.text,
                                numberOfTeams: teamSizeController.text,
                                starRegDate: startDateRegister,
                                endRegDate: endDateRegister,
                                hackStartDate: startDatehack,
                                hackEndDate: endDatehack,
                                field: hackField,
                                description: hackDetailsController.text,
                                location: locationController.text);
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
