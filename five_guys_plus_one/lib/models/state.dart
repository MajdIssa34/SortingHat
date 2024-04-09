
import 'dart:collection';

import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:flutter/foundation.dart';

class StateModel extends ChangeNotifier{

  //all of the questions
  final List<QuizQuestion> _questions = [
  const QuizQuestion(
    "When you think about the future, which aspect of technology excites you the most?",
    [
      'Creating intelligent systems that can learn and adapt',
      'Securing digital assets and preventing cyber threats',
      'Extracting insights and patterns from large datasets',
      'Developing efficient and user-friendly software solutions',
      'Building innovative web and mobile applications',
    ],
    [
      'AI',
      'Cyber',
      'DS',
      'ST',
      'WMAD',
      
    ] 
    ),
  const QuizQuestion(
    "How do you prefer to approach problem-solving?",
    [
      'Analyzing data and drawing conclusions ',
      'Crafting solutions that balance functionality and security',
      'Designing intuitive user interfaces',
      'Implementing algorithms and optimizing performance',
      'Integrating various systems for seamless operation',
    ],
    [
      'DS',
      'Cyber',
      'WMAD',
      'AI',
      'NW',
    ] 
    ),
    const QuizQuestion(
    "Which area of technology do you find most intriguing?",
    [
      'Predictive analytics and machine learning ',
      'Defending against cyber threats and attacks',
      'Designing and managing information systems',
      'Developing software applications for diverse purposes',
      'Creating interactive and engaging digital experiences',
    ],
    [
      'AI',
      'Cyber',
      'ISBA',
      'ST',
      'GDD',
    ] 
    ),
];

  //get questions method
  UnmodifiableListView<QuizQuestion> get questions => UnmodifiableListView(_questions);

  //method to get a specific question
  QuizQuestion getSpecificQuestion(int i){
    return _questions[i];
  }
  //method to add questions to the list
  void add(QuizQuestion q){
    _questions.add(q);
    notifyListeners();
  }

   
}