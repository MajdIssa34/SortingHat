import 'dart:collection';
import 'package:five_guys_plus_one/data/questions_data.dart';
import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:flutter/foundation.dart';
class StateModel extends ChangeNotifier {
  int? _selectedAnswerIndex;
  int? get selectedAnswerIndex => _selectedAnswerIndex;

  //function to select answer
  void selectAnswer(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }

  //function to confirm and advance
  void confirmAndAdvanceQuestion() {
    if (_selectedAnswerIndex != null) {
      _answers[currentQuestion] = questionnaireQuestions[currentQuestion]
          .answersList[_selectedAnswerIndex ?? 0];
      _keys[currentQuestion] = questionnaireQuestions[currentQuestion]
          .keys[_selectedAnswerIndex ?? 0];
      _selectedAnswerIndex = null;
      print(_keys);
      notifyListeners();
      advanceQuestion();
    }
  }

  //function to get process
  double get progress => (currentQuestion) / questionnaireQuestions.length;

  //fuction to get a major's description
  String getDescription(String major) {
    return majorDescriptions[major] ?? '';
  }

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
      UnmodifiableListView(questionnaireQuestions);

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
    _selectedAnswerIndex = null;
    _answers =
        List<String>.filled(questionnaireQuestions.length, "", growable: true);
    _keys =
        List<String>.filled(questionnaireQuestions.length, "", growable: true);
    notifyListeners();
  }

  //method to reset the quiz questions only.
  void resetQuizQuestion() {
    currentQuestion = 0;
    _status = 'in-progress';
    _selectedAnswerIndex = null;
    _answers =
        List<String>.filled(questionnaireQuestions.length, "", growable: true);
    _keys =
        List<String>.filled(questionnaireQuestions.length, "", growable: true);
    notifyListeners();
  }

  //method to advance to the next question
  void advanceQuestion() {
    if (++currentQuestion >= questionnaireQuestions.length) {
      _status = "complete";
      currentQuestion--;
      notifyListeners();
    }
  }

  //method to get currentQuestion
  QuizQuestion getCurrentQuestion() => questionnaireQuestions[currentQuestion];

  //method to get a specific question
  QuizQuestion getSpecificQuestion(int i) {
    return questionnaireQuestions[i];
  }

  //method to add questions to the list
  void add(QuizQuestion q) {
    questionnaireQuestions.add(q);
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
    _answers = List<String>.filled(questionnaireQuestions.length, "fill");
    _keys = List<String>.filled(questionnaireQuestions.length, "");
  }

  void goBack() {
    if (currentQuestion > 0) {
      currentQuestion--;
      // Re-select the previously selected answer index when going back
      _selectedAnswerIndex = questionnaireQuestions[currentQuestion]
          .answersList
          .indexOf(_answers[currentQuestion]);
      notifyListeners();
    }
  }

  //method to get key for each answer
  String getKeyForAnswer(String answer) {
    int keyIndex = 0;
    for (int i = 0;
        i < questionnaireQuestions[currentQuestion].answersList.length;
        i++) {
      if (questionnaireQuestions[currentQuestion].answersList[i] == answer) {
        keyIndex = i;
      }
    }
    return questionnaireQuestions[currentQuestion].keys[keyIndex];
  }

  //method to get key for the final answer
  String getKeyForFinalAnswer(String answer) {
    int keyIndex = 0;
    for (int i = 0; i < finalQuestion.answersList.length; i++) {
      if (finalQuestion.answersList[i] == answer) {
        keyIndex = i;
      }
    } 
    return finalQuestion.keys[keyIndex];
  }

  // Get final Recommended Major
  // Add a property to store tied majors
  List<String> _tiedMajorsKeys = [];
// Modify the method to detect ties
  String getRecommendedMajor() {
    Map<String, int> keyOccurrences = {};
    for (String key in _keys) {
      if (key.isNotEmpty) {
        keyOccurrences[key] = (keyOccurrences[key] ?? 0) + 1;
      }
    }
    if (keyOccurrences.isEmpty) {
      return "No recommendations available";
    }
    int highestOccurrence =
        keyOccurrences.values.reduce((a, b) => a > b ? a : b);
    List<String> highestKeys = keyOccurrences.entries
        .where((entry) => entry.value == highestOccurrence)
        .map((entry) => entry.key)
        .toList();

    if (highestKeys.length == 1) {
      _tiedMajorsKeys.clear(); // Clear any previously tied keys
      return getMajorFromKey(highestKeys.first);
    } else {
      _tiedMajorsKeys = highestKeys;
      return "tie"; // Indicates a tie situation
    }
  }

// Get Tiebreaker Question
  QuizQuestion getTiebreakerQuestion() {
    List<String> majorChoices =
        _tiedMajorsKeys.map((key) => getMajorFromKey(key)).toList();

    return getAnswersBasedOnQuestions(majorChoices);
  }

  //get final question.
  QuizQuestion getAnswersBasedOnQuestions(List<String> choices) {
    List<String> answers = [];
    List<String> ke = [];
    for (int i = 0; i < finalQuestion.keys.length; i++) {
      for (int j = 0; j < choices.length; j++) {
        if (getMajorFromKey(finalQuestion.keys[i]) == choices[j]) {
          answers.add(finalQuestion.answersList[i]);
          ke.add(finalQuestion.keys[i]);
        }
      }
    }
    return QuizQuestion(finalQuestion.questionText, answers, ke);
  }

// Process Tiebreaker Answer
  void selectTiebreakerAnswer(String major) {
    _keys.clear();

    _keys.add(getKeyForFinalAnswer(major));
  }

  //method to get major from keys
  String getMajorFromKey(String key) {
    switch (key) {
      case 'AI':
        return 'Bachelor of IT majoring in Artificial Intelligence';
      case 'CYB':
        return 'Bachelor of IT majoring in Cybersecurity';
      case 'DS':
        return 'Bachelor of IT majoring in Data Science';
      case 'ST':
        return 'Bachelor of IT majoring in Software Technology';
      case 'WMAD':
        return 'Bachelor of IT majoring in Web and Mobile Application Development';
      case 'NET':
        return 'Bachelor of IT majoring in Network Engineering';
      case 'ISBA':
        return 'Bachelor of IT majoring in Information Systems and Business Analytics';
      case 'GDD':
        return 'Bachelor of Game Design and Development';
      default:
        return 'Unknown Major';
    }
  }

  String getKeyFromMajor(String major) {
    Map<String, String> majorToKey = {
      'Bachelor of IT majoring in Artificial Intelligence': 'AI',
      'Bachelor of IT majoring in Cybersecurity': 'CYB',
      'Bachelor of IT majoring in Data Science': 'DS',
      'Bachelor of IT majoring in Software Technology': 'ST',
      'Bachelor of IT majoring in Web and Mobile Application Development': 'WMAD',
      'Bachelor of IT majoring in Network Engineering': 'NET',
      'Bachelor of IT majoring in Information Systems and Business Analytics': 'ISBA',
      'Bachelor of Game Design and Development': 'GDD'
    };

    return majorToKey[major] ??
        'Unknown'; // Return 'Unknown' if the major isn't found
  }

  String getMajorLink() {
    String majorName = getRecommendedMajor();  // This method should return the full name of the major.

    switch (majorName) {
        case 'Bachelor of IT majoring in Artificial Intelligence':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/artificial-intelligence';
        case 'Bachelor of IT majoring in Cybersecurity':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/cyber-security';
        case 'Bachelor of IT majoring in Data Science':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/data-science';
        case 'Bachelor of IT majoring in Software Technology':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/software-technology';
        case 'Bachelor of IT majoring in Web and Mobile Application Development':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/web-and-mobile-app-development';
        case 'Bachelor of IT majoring in Network Engineering':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/networking';
        case 'Bachelor of IT majoring in Information Systems and Business Analytics':
            return'https://www.mq.edu.au/study/find-a-course/courses/major/information-systems-and-business-analysis';
        case 'Bachelor of Game Design and Development':
            return'https://www.mq.edu.au/study/find-a-course/courses/bachelor-of-game-design-and-development';
        default:
            return'https://www.mq.edu.au/study/find-a-course';  // Default or unknown major link
    }
}

}
