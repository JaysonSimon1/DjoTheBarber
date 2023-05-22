import 'package:flutter/material.dart';
import 'package:flutter_djothebarber/PopUpForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        // Button voor de pop-up te laten zien
        child: InkWell(
          child: Container(
            width: 300,
            height: 150,
            color: Colors.green.shade300,
            child: const Center(
              child: Text(
                'Show Pop-Up',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            showPopUpForm(context);
          },
        ),
      ),
    );
  }

  // functie voor pop-up te laten verschijnen
  void showPopUpForm(BuildContext context) {
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
