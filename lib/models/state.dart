import 'dart:collection';

import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:flutter/foundation.dart';

class StateModel extends ChangeNotifier {
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
        ]),
    const QuizQuestion("How do you prefer to approach problem-solving?", [
      'Analyzing data and drawing conclusions ',
      'Crafting solutions that balance functionality and security',
      'Designing intuitive user interfaces',
      'Implementing algorithms and optimizing performance',
      'Integrating various systems for seamless operation',
    ], [
      'DS',
      'Cyber',
      'WMAD',
      'AI',
      'NW',
    ]),
    const QuizQuestion(
        "Which area of technology do you find most intriguing?", [
      'Predictive analytics and machine learning ',
      'Defending against cyber threats and attacks',
      'Designing and managing information systems',
      'Developing software applications for diverse purposes',
      'Creating interactive and engaging digital experiences',
    ], [
      'AI',
      'Cyber',
      'ISBA',
      'ST',
      'GDD',
    ]),
  ];
  //list to store all answers
  List<String> _answers = [];

  //list to store all keys
  List<String> _keys = [];

  int currentQuestion = 0;
  String _status = 'start';

  // intitialising the quiz in the constructor
  StateModel() {
    resetQuiz();
  }
  //get questions method
  UnmodifiableListView<QuizQuestion> get questions =>
      UnmodifiableListView(_questions);

  //get questions method
  UnmodifiableListView<String> get answers => UnmodifiableListView(_answers);

  //get keys method
  UnmodifiableListView<String> get keys => UnmodifiableListView(_keys);

  //method to get the current question number
  int get currentQuestionNumber => currentQuestion + 1;

  //get quiz status
  String get quizStatus => _status;

  //method to sart the quiz
  void startQuiz() {
    _status = 'in-progress';
    notifyListeners();
  }

  //method to reset the quiz
  void resetQuiz() {
    currentQuestion = 0;
    _status = 'start';
    resetAnswers();
    notifyListeners();
  }

  //method to advance to the next question
  void advanceQuestion() {
    if (++currentQuestion >= _questions.length) {
      _status = "complete";
      currentQuestion--;
      notifyListeners();
    }
  }

  //method to get currentQuestion
  QuizQuestion getCurrentQuestion() => _questions[currentQuestion];

  //method to get a specific question
  QuizQuestion getSpecificQuestion(int i) {
    return _questions[i];
  }

  //method to add questions to the list
  void add(QuizQuestion q) {
    _questions.add(q);
    notifyListeners();
  }

  //method to add answers
  void addAnswer(String answer, String key) {
    _answers[currentQuestion] = answer;
    _keys[currentQuestion] = key;
    notifyListeners();
  }

  //method to reset answers
  void resetAnswers() {
    _answers = List<String>.filled(_questions.length, "fill");
    _keys = List<String>.filled(_questions.length, "");
  }

  //method to get summary data
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < _answers.length; i++) {
      summaryData.add({
        'questionIndex': i,
        'question': _questions[i].questionText,
        'chosenAnswer': _answers[i],
        'chosenKeys': _keys[i],
      });
    }
    return summaryData;
  }

  //method to get key for each answer
  String getKeyForAnswer(String answer){
    int keyIndex=0;
    for(int i = 0 ; i < _questions[currentQuestion].answersList.length ;i++){
      if(_questions[currentQuestion].answersList[i] == answer){
        keyIndex = i;
      }
    }
    return _questions[currentQuestion].keys[keyIndex];
  }
}
