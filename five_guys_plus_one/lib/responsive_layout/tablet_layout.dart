import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: myAppBar,
  //backgroundColor: defaultBackgroundColor,
  drawer: myDrawer,
  body: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets\\images\\Macquarie_University Logo.png',
          width: 300,
        ),
        const SizedBox(height: 30),
        const Text(
          "Are you ready for the quiz?",
          style: TextStyle(
            color: Color.fromRGBO(214, 0, 28, 1.0),
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt_rounded),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xff401201),
            ),
            onPressed: startQuiz,
            label: const Text(
              "Start the Quiz",
              style: TextStyle(
                fontSize: 16,
              ),
            )),
        Image.asset(
          'assets\\images\\Six_Guys_Logo.png',
          width: 300,
        ),
      ],
    ),
  ),
);
  }
}