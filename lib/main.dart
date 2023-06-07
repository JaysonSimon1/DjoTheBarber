import 'package:djo_homepage/views/home/home_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAXQ-ynRadjzk4haN_i_PLfcjz-bgI-P44",
      appId: "1:294416703656:web:6f89a468b98a6e20d9229d",
      messagingSenderId: "294416703656",
      projectId: "djothebarberdatabase",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
           home:HomeView()
        );
  }
}

// functie voor pop-up te laten verschijnen
  showPopUpForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: popUpForm.popUpFormHeight,
            width: popUpForm.popUpFormWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
            ),
            child: PopUpForm(),
          ),
        );
      },
    );
  }
}

