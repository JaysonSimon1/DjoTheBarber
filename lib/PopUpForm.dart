// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

PopUpForm popUpForm = PopUpForm();

// ignore: must_be_immutable
class PopUpForm extends StatefulWidget {
  double popUpFormHeight = 600;
  double popUpFormWidth = 800;

  PopUpForm({
    super.key,
  });

  @override
  State<PopUpForm> createState() => _PopUpFormState();
}

class _PopUpFormState extends State<PopUpForm> {
  int currentStep = 0;

  //Variables voor kapper opties
  bool gekozenKapper1 = false;
  bool gekozenKapper2 = false;
  String geselecteerdeKapper = '';

  //Variables voor behandeling opties
  String geselecteerdeBehandeling = '';
  bool gekozenBehandeling1 = false;
  bool gekozenBehandeling2 = false;
  bool gekozenBehandeling3 = false;
  bool gekozenBehandeling4 = false;
  bool gekozenBehandeling5 = false;
  bool gekozenBehandeling6 = false;
  bool gekozenBehandeling7 = false;

  //Variables voor de agenda
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  //TextEditingControllers
  final naam = TextEditingController();
  final telefoon = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.green.shade300)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;

            if (isLastStep) {
              //Afsluiten
              Navigator.pop(context);
            } else if (geselecteerdeKapper == '') {
              //Checken als de eerste stap is ingevuld
              currentStep = currentStep;
            } else if (currentStep == 1 && geselecteerdeBehandeling == '') {
              //Checken als de tweede stap is ingevuld
              currentStep = currentStep;
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: currentStep == 0
              ? null
              : () => setState(() {
                    currentStep -= 1;
                  }),
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            final isLastStep = currentStep == getSteps().length - 1;

            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  if (currentStep != 0)
                    //Button Vorige
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 50),
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: controls.onStepCancel,
                        child: const Text(
                          'Vorige',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    width: 12,
                  ),
                  //Button Volgende
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                      ),
                      onPressed: controls.onStepContinue,
                      child: Text(
                        isLastStep ? 'Afpsraak Maken' : 'Volgende',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        stepOne(),
        stepTwo(),
        stepThree(),
        stepFour(),
        stepFive(),
      ];

  //Stap Een
  Step stepOne() {
    return Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text(''),
      content: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              'Kies kapper',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Djothebarber optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Djothebarber',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenKapper1,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenKapper2 == true) gekozenKapper2 = false;
                  gekozenKapper1 = value!;
                  geselecteerdeKapper = 'Djothebarber';
                });
              },
              secondary: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //BarbeiroHanie optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'BarbeiroHanie',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenKapper2,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenKapper1 == true) gekozenKapper1 = false;
                  gekozenKapper2 = value!;
                  geselecteerdeKapper = 'BarbeiroHanie';
                });
              },
              secondary: const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }

  //Stap Twee
  Step stepTwo() {
    return Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,
      title: const Text(''),
      content: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              'Kies behandeling',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Heren knipbeurt optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Heren knipbeurt/ Haircut',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(30 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling1,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling2 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling6 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling2 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling6 = false;
                    gekozenBehandeling7 = false;
                  }
                  gekozenBehandeling1 = value!;
                  geselecteerdeBehandeling = 'Heren knipbeurt/ Haircut';
                });
              },
              secondary: const Text('€25,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Heren knippen + baard optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Heren knippen + baard/ Haircut + Beard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(30 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling2,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling6 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling6 = false;
                    gekozenBehandeling7 = false;
                  }

                  gekozenBehandeling2 = value!;
                  geselecteerdeBehandeling =
                      'Heren knippen + baard/ Haircut + Beard';
                });
              },
              secondary: const Text('€30,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //2 personen knipbeurt optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                '2 personen knipbeurt/ Haircut for 2 persons',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(60 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling3,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling2 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling6 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling2 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling6 = false;
                    gekozenBehandeling7 = false;
                  }

                  gekozenBehandeling3 = value!;
                  geselecteerdeBehandeling =
                      '2 personen knipbeurt/ Haircut for 2 persons';
                });
              },
              secondary: const Text('€50,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Heren contouren optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Heren contouren (line up)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(15 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling4,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling2 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling6 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling2 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling6 = false;
                    gekozenBehandeling7 = false;
                  }

                  gekozenBehandeling4 = value!;
                  geselecteerdeBehandeling = 'Heren contouren (line up)';
                });
              },
              secondary: const Text('€10,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Kinderen t/m 12 jaar optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Kinderen t/m 12 jaar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(30 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling5,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling2 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling6 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling2 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling6 = false;
                    gekozenBehandeling7 = false;
                  }

                  gekozenBehandeling5 = value!;
                  geselecteerdeBehandeling = 'Kinderen t/m 12 jaar';
                });
              },
              secondary: const Text('€15,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Heren knippen + baard + wassen optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Heren knippen + baard + wassen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(45 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling6,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling2 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling7 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling2 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling7 = false;
                  }

                  gekozenBehandeling6 = value!;
                  geselecteerdeBehandeling = 'Heren knippen + baard + wassen';
                });
              },
              secondary: const Text('€35,00'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Heren baard optie
          Material(
            elevation: 10.0,
            shadowColor: Colors.blueGrey,
            child: CheckboxListTile(
              activeColor: Colors.green,
              title: const Text(
                'Heren baard/ Beard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              subtitle: const Text('(30 minuten)'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              value: gekozenBehandeling7,
              onChanged: (bool? value) {
                setState(() {
                  if (gekozenBehandeling1 ||
                      gekozenBehandeling2 ||
                      gekozenBehandeling3 ||
                      gekozenBehandeling4 ||
                      gekozenBehandeling5 ||
                      gekozenBehandeling6 == true) {
                    gekozenBehandeling1 = false;
                    gekozenBehandeling2 = false;
                    gekozenBehandeling3 = false;
                    gekozenBehandeling4 = false;
                    gekozenBehandeling5 = false;
                    gekozenBehandeling6 = false;
                  }

                  gekozenBehandeling7 = value!;
                  geselecteerdeBehandeling = 'Heren baard/ Beard';
                });
              },
              secondary: const Text('€15,00'),
            ),
          ),
        ],
      ),
    );
  }

  //Stap drie
  Step stepThree() {
    return Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,
      title: const Text(''),
      content: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              'Kies datum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TableCalendar(
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, selectedDay),
            focusedDay: selectedDay,
            firstDay: today,
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
          ),
        ],
      ),
    );
  }

  //Stap vier
  Step stepFour() {
    return Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 3,
      title: const Text(''),
      content: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              'Afspraak bevestigen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: naam,
            decoration: const InputDecoration(labelText: 'Naam'),
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return 'Dit vak is verplicht';
              }
            }),
          ),
          TextFormField(
            controller: telefoon,
            decoration: const InputDecoration(labelText: 'Telefoon Nummer'),
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(labelText: 'E-mail Adres'),
          )
        ],
      ),
    );
  }

  //Stap vijf
  Step stepFive() {
    return Step(
      state: currentStep > 4 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 4,
      title: const Text(''),
      content: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text(
              'Samenvatting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(geselecteerdeKapper),
          const SizedBox(
            height: 30,
          ),
          Text(geselecteerdeBehandeling),
          const SizedBox(
            height: 30,
          ),
          Text(naam.text),
          const SizedBox(
            height: 30,
          ),
          Text(telefoon.text),
          const SizedBox(
            height: 30,
          ),
          Text(email.text),
          const SizedBox(
            height: 30,
          ),
          Text(selectedDay.toString().split(" ")[0])
        ],
      ),
    );
  }
}
