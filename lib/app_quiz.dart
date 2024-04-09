
import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/screens/home_screen/app_home_screen.dart';
import 'package:five_guys_plus_one/screens/questions_screen/app_questions_screen.dart';
import 'package:five_guys_plus_one/app_results_screen.dart';
import 'package:five_guys_plus_one/data/questions.dart';
import 'package:provider/provider.dart';

class Quiz extends StatelessWidget{

  Quiz({super.key});
  


  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<StateModel>(
        builder: (context, value, child) {
          return Scaffold(
          body: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: switch(value.quizStatus){
              'in-progress' => QuestionsScreen(),
              'complete' => ResultsScreen(),
              _ => const HomeScreen(),
            }
            )
        );
        },
        
      ),
    );
  }
}