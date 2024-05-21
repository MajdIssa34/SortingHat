import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/screens/app_home_screen.dart';
import 'package:five_guys_plus_one/screens/app_questions_screen.dart';
import 'package:five_guys_plus_one/screens/final_screen_decider.dart';
import 'package:provider/provider.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});
  
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<StateModel>(
        builder: (context, value, child) {
          return Scaffold(
            body: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: _getScreen(value.quizStatus),
            ),
          );
        },
      ),
    );
  }

  Widget _getScreen(String quizStatus) {
    if (quizStatus == 'in-progress') {
      return const QuestionsScreen();
    } else if (quizStatus == 'complete') {
      return const ResultsScreen();
    } else {
      return const HomeScreen();
    }
  }
}
