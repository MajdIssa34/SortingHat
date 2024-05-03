import 'package:five_guys_plus_one/constants/app_answer_button.dart';
import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/questions_screen/questionnaire_widget.dart';
import 'package:five_guys_plus_one/screens/result_screens/tie_breaker_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(
      builder: (context, state, child) {
        String recommendedMajor = state.getRecommendedMajor();
        if (recommendedMajor == "tie") {
          QuizQuestion tiebreaker = state.getTiebreakerQuestion();
          bool isDesktop = MediaQuery.of(context).size.width >= 1000;

          return Scaffold(
            appBar: myAppBar,
            drawer: buildMyDrawer(context, 2),
            body: questionnaireBackground(
              Center(
                child: isDesktop
                    ? desktopLayout(state, isDesktop, tiebreaker,
                        context) // use desktop layout for tiebreaker
                    : mobileTabletLayout(state, isDesktop, tiebreaker,
                        context), // use mobile layout for tiebreaker
              ),
            ),
          );
        } else {
          // Display recommended major using a common widget
          return _buildResultsLayout(context, recommendedMajor, state);
        }
      },
    );
  }

  Widget _buildResultsLayout(
      BuildContext context, String major, StateModel state) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(
                      margin: const EdgeInsets.all(60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Your major is",
                              style: GoogleFonts.oswald(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 30),
                          Text(major,
                              style: GoogleFonts.oswald(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 30),
                          Text(state.getDescription(major),
                              style: GoogleFonts.oswald(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 30),
                          AnswerButton(
                              answerText: "Restart Quiz",
                              onAnswerSelect: () {
                                state.resetQuiz();
                                Navigator.of(context).popUntil((route) => route
                                    .isFirst); // Go back to the first screen
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
