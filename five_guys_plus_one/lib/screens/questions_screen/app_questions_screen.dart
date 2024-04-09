// ignore_for_file: must_be_immutable

import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/constants/app_answer_button.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<StateModel>(builder: (context, value, child) {
      var currentQuestion = value.getCurrentQuestion();
      return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.questionText,
                style: const TextStyle(
                  color: Color(0xff401201),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 30,
              ),
              ...currentQuestion.answersList.map((answer) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnswerButton(
                      answerText: answer,
                      onAnswerSelect: () {
                        //add answer and its corresponding key
                        value.addAnswer(answer, value.getKeyForAnswer(answer));
                        value.advanceQuestion();
                      }),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
