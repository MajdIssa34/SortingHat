import 'dart:collection';

import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:flutter/foundation.dart';

class StateModel extends ChangeNotifier {
  int? _selectedAnswerIndex;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  final QuizQuestion finalQuestion = const QuizQuestion("Which of these team roles do you usually take?",
        [
          'The one who oversees the project\'s business impact',
          'The one who handles all things security',
          'The team\'s go-to for all things numbers ',
          'The creative lead, focusing on the artistic and narrative aspects',
          'The technical lead, focusing on implementing the project\'s core features ',
          'The UI/UX designer, focusing on the project\'s interface and user interaction',
          'The tech visionary, bringing in new ideas and innovations',
          'The engineer, integrating different technologies to work together',
        ],
        [
          'ISBA',
          'Cyber',
          'DS',
          'GDD',
          'ST',
          'WMAD',
          'AI',
          'NW',
        ]);
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
          'GDD',
          'ST',
          'WMAD',
          'AI',
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
      'AI',
      'Cyber',
      'ISBA',
      'ST',
      'GDD',
    ]),
  ];
  //map of all majors and their descriptions
  Map<String, String> majorDescriptions = {
    "Bachelor of Artificial Intelligence":
        "This major focuses on the creation and management of intelligent systems capable of performing tasks that typically require human intelligence. Students learn about machine learning algorithms, neural networks, natural language processing, robotics, and the ethical considerations of AI.",
    "Bachelor of Cybersecurity":
        "In this major, students are trained to protect computer systems, networks, and data from cyber threats and attacks. The curriculum covers topics such as information security, network security, cryptography, ethical hacking, and digital forensics.",
    "Bachelor of Data Science":
        "This field of study is centered around extracting insights and knowledge from data. Students learn to apply statistical methods, machine learning algorithms, data mining techniques, and big data technologies to analyze, visualize, and interpret large datasets.",
    "Bachelor of Software Technology":
        "This major is focused on the development of software solutions. It covers a wide range of topics, including programming languages, software engineering principles, database management, system analysis and design, and the development of desktop, web, and mobile applications.",
    "Bachelor of Web and Mobile Application Development":
        "Students in this major learn to design and develop applications for the web and mobile devices. The curriculum includes web technologies, mobile app development frameworks, user interface and experience design, responsive design, and cross-platform development.",
    "Bachelor of Network Engineering":
        "This major prepares students to design, implement, and manage computer networks. Topics include network architecture, protocols, security, administration, and the integration of enterprise and cloud networks.",
    "Bachelor of Information Systems and Business Analytics":
        "This field combines information technology with business management. Students learn how to design and manage information systems and use analytics to solve business problems, improve decision-making, and gain strategic advantages.",
    "Bachelor of Game Design and Development":
        "Focused on the creation of digital games, this major covers the principles of game design, development processes, storytelling in games, programming for game engines, graphics and sound design, and the study of the gaming industry and culture."
  };

  //function to select answer
  void selectAnswer(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }

  //function to confirm and advance
  void confirmAndAdvanceQuestion() {
    if (_selectedAnswerIndex != null) {
      _answers[currentQuestion] =
          _questions[currentQuestion].answersList[_selectedAnswerIndex ?? 0];
      _keys[currentQuestion] =
          _questions[currentQuestion].keys[_selectedAnswerIndex ?? 0];
      _selectedAnswerIndex = null;

      notifyListeners();
      advanceQuestion();
      print(_keys);
    }
  }

  //function to get process
  double get progress => (currentQuestion) / _questions.length;

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
    _selectedAnswerIndex = null;
    _answers = List<String>.filled(_questions.length, "", growable: true);
    _keys = List<String>.filled(_questions.length, "", growable: true);
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

  void goBack() {
    if (currentQuestion > 0) {
      currentQuestion--;
      // Re-select the previously selected answer index when going back
      _selectedAnswerIndex = _questions[currentQuestion]
          .answersList
          .indexOf(_answers[currentQuestion]);
      notifyListeners();
    }
  }

  //method to get key for each answer
  String getKeyForAnswer(String answer) {
    int keyIndex = 0;
    for (int i = 0; i < _questions[currentQuestion].answersList.length; i++) {
      if (_questions[currentQuestion].answersList[i] == answer) {
        keyIndex = i;
      }
    }
    return _questions[currentQuestion].keys[keyIndex];
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
  QuizQuestion getAnswersBasedOnQuestions(List<String> choices){
    List<String> answers = [];
    List<String> ke = [];
    for(int i = 0 ; i< finalQuestion.keys.length ; i++){
      for(int j = 0 ; j < choices.length ; j++){
        if(getMajorFromKey(finalQuestion.keys[i]) == choices[j]){
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
        return 'Bachelor of Artificial Intelligence';
      case 'Cyber':
        return 'Bachelor of Cybersecurity';
      case 'DS':
        return 'Bachelor of Data Science';
      case 'ST':
        return 'Bachelor of Software Technology';
      case 'WMAD':
        return 'Bachelor of Web and Mobile Application Development';
      case 'NW':
        return 'Bachelor of Network Engineering';
      case 'ISBA':
        return 'Bachelor of Information Systems and Business Analytics';
      case 'GDD':
        return 'Bachelor of Game Design and Development';
      default:
        return 'Unknown Major';
    }
  }
  String getKeyFromMajor(String major) {
    Map<String, String> majorToKey = {
      'Bachelor of Artificial Intelligence': 'AI',
      'Bachelor of Cybersecurity': 'Cyber',
      'Bachelor of Data Science': 'DS',
      'Bachelor of Software Technology': 'ST',
      'Bachelor of Web and Mobile Application Development': 'WMAD',
      'Bachelor of Network Engineering': 'NW',
      'Bachelor of Information Systems and Business Analytics': 'ISBA',
      'Bachelor of Game Design and Development': 'GDD'
    };

    return majorToKey[major] ?? 'Unknown';  // Return 'Unknown' if the major isn't found
}

}
