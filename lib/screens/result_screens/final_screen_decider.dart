import 'package:five_guys_plus_one/constants/app_answer_button.dart';
import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/questions_screen/questionnaire_widget.dart';
import 'package:five_guys_plus_one/screens/result_screens/results_screen.dart';
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
        bool isDesktop = MediaQuery.of(context).size.width >= 1000;
        if (recommendedMajor == "tie") {
          QuizQuestion tiebreaker = state.getTiebreakerQuestion();
          //bool isDesktop = MediaQuery.of(context).size.width >= 1000;

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
          return questionnaireBackground(
            Center(
                child: isDesktop
                    ? desktopResultsScreen(context, state, recommendedMajor, isDesktop)
                    : mobileResultsScreen(context, state, recommendedMajor, isDesktop)),
          );
        }
      },
    );
  }
}
