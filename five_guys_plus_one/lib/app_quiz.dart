
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/screens/home_screen/app_home_screen.dart';
import 'package:five_guys_plus_one/screens/questions_screen/app_questions_screen.dart';
import 'package:five_guys_plus_one/screens/result_screens/app_results_screen.dart';
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
  //List<String> keys = [];

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
    // ignore: avoid_print
    print(selectedAnswers.length);
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: activeScreen
          )
      ),
    );
  }
}