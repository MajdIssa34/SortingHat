import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/screens/result_screens/app_summary_section.dart';
import 'package:five_guys_plus_one/data/questions.dart';


class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.collatedAnswers, required this.restartQuiz});

  final List<String> collatedAnswers;
  final void Function() restartQuiz;
  final List<int> indices = [];

  List<Map<String,Object>> getSummaryData(){
  List<Map<String,Object>> summaryData = [];

    for(var loopVariable=0; loopVariable < collatedAnswers.length; loopVariable++){
      summaryData.add({
        'questionIndex': loopVariable,
        'question': questions[loopVariable].questionText,
        'chosenAnswer':collatedAnswers[loopVariable],
        'keys': getKeys()[loopVariable],
      });
    
    }
    return summaryData;
  }
  void add(){
    getSummaryData().add({'keys':getKeys()});
  }
  
  List<int> port(){
    //List<int> integers = [];
    for(int i=0 ; i < 3 ; i++){
      for(int j = 0 ; j < 5 ; j++){
        if(questions[i].answersList[j] == collatedAnswers[i]){
          indices.add(j);
        }
      }
    }
    return indices; 
  }

  List<String> getKeys(){
    List<int> myIndices = port();
    List<String> myKeys = [];
    for(int i=0 ; i < 3; i++){
      myKeys.add(questions[i].keys[myIndices[i]]);
    }
    return myKeys;
  }

  @override
  Widget build(context) {
    
    final summaryData = getSummaryData();
    final numOfQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data){
      return data['correctAnswer'] == data['chosenAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You have answered $numOfCorrectAnswers out of $numOfQuestions Questions Correctly! ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff401201),  
              ),
              textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            SummarySection(summaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: restartQuiz, child: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
