import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_dropdown.dart';
import 'package:team_hack/screens/add_hackathon/components/widget_textfield_date.dart';
import 'package:team_hack/widgets/widget_textfield.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WidgetTextField(
                  textFieldText: 'Enter Hackathon Name',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                WidgetDropdownButton(
                  listString: listField,
                  labelDropdownButton: 'Hackathon Field:',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                const WidgetTextField(
                  textFieldText: 'Enter The Location',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: WidgetTextFieldDate(
                          selectDate: () {
                            selectStartDateRegister(context);
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
                          selectDate: () {
                            selectEndDateRegister(context);
                          },
                          controllerDate: conEndDateRegister,
                          textfieldText: 'EndDate of Register',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: WidgetTextFieldDate(
                        selectDate: () {
                          selectStartDateHack(context);
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
                        selectDate: () {
                          selectEndDateHack(context);
                        },
                        controllerDate: conEndDatehack,
                        textfieldText: 'EndDate of Hackathon',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                const WidgetTextField(
                  textFieldText: 'Enter Hackathon Details',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                WidgetDropdownButton(
                  listString: listNumTeam,
                  labelDropdownButton: 'Number of team member:',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                const WidgetTextField(
                  textFieldText: 'Enter Team Size',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                      child: const Text('Add'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
