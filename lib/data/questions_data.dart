import 'package:five_guys_plus_one/models/question_model.dart';

const QuizQuestion finalQuestion = QuizQuestion("Which of these team roles do you usually take?",
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
  final List<QuizQuestion> questionnaireQuestions = [
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
