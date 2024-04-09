import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/screens/result_screens/app_summary_section.dart';
import 'package:five_guys_plus_one/data/questions.dart';
import 'package:provider/provider.dart';


class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key});

  @override
  Widget build(context) {
    
    return Consumer<StateModel>(
      builder:(context, value, child) {

        final summaryData = value.getSummaryData();
        final numOfQuestions = questions.length;
        final List<String> answerKeys = value.keys;
        return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SummarySection(summaryData),
              const SizedBox(height: 30),
              TextButton(onPressed: value.resetQuiz, child: const Text("Restart Quiz"))
            ],
          ),
        ),
      );
      },
      
    );
  }
}
