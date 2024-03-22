import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Scaffold(
              appBar: myAppBar,
              backgroundColor: defaultBackgroundColor,
              drawer: myDrawer,
            ),
          ),
          Image.asset(
            'assets\\images\\Macquarie_University Logo.png',
            width: 300,
          ),
          const SizedBox(height: 30),
          const Text(
            "Harry Potter Quiz App",
            style: TextStyle(
              color: Color(0xff401201),
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
              ))
        ],
      ),
    );
  }
}