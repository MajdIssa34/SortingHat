import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/app_answer_button.dart';
import 'package:five_guys_plus_one/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key, required this.onSelectAnswer});

  void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion =
        questions[currentQuestionIndex]; //access the first question

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
            const SizedBox(width: 30,),
          // Column(
          //   children: [
          //     ElevatedButton(onPressed: (){} , child: Text(currentQuestion.answersList[0])),
          //     const SizedBox(height: 16,), // Add space between buttons
          //     ElevatedButton(onPressed: (){}, child: Text(currentQuestion.answersList[1])),
          //   ],
          // )
          ...currentQuestion.answersList.map((answer) {
            return AnswerButton(answerText: answer, onAnswerSelect: () {answerQuestion(answer);});
          }),
          ],
        ),
      ),
    );
  }
}
