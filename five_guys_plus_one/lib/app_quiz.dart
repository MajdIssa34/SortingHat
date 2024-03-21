
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/app_home_screen.dart';
import 'package:five_guys_plus_one/app_questions_screen.dart';
import 'package:five_guys_plus_one/app_results_screen.dart';
import 'package:five_guys_plus_one/data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz>{

  Widget? activeScreen;
  List<String> selectedAnswers = [];
  List<String> keys = [];

  @override
  void initState() {
    activeScreen = HomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: collectAnswers
        );
    });
  }

  void collectAnswers(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(collatedAnswers: selectedAnswers,restartQuiz: restartQuiz,);
        selectedAnswers = [];
      });
    }
  }

  void restartQuiz(){
    setState(() {
      activeScreen = HomeScreen(switchScreen);
    });
  }


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xffF2D3AC),
          child: activeScreen
          )
      ),
    );
  }
}