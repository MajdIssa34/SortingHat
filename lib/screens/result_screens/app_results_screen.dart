import 'package:five_guys_plus_one/constants/app_answer_button.dart';
import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/questions_screen/questionnaire_widget.dart';
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
            drawer: buildMyDrawer(context),
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

  Widget mobileTabletLayout(
      StateModel state, bool isDesktop, QuizQuestion currentQuestion, context) {
    //final currentQuestion = state.getCurrentQuestion();
    return styledQuestionContainer(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Final Question: ${currentQuestion.questionText}',
                  style: GoogleFonts.oswald(
                      fontSize: isDesktop ? 60 : 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables scrolling within the ListView itself
                    itemCount: currentQuestion.answersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: RadioListTile<int>(
                          title: Text(
                            currentQuestion.answersList[index],
                            style: GoogleFonts.oswald(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          value: index,
                          groupValue: state.selectedAnswerIndex,
                          onChanged: (int? value) {
                            if (value != null) {
                              state.selectAnswer(value);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: state.selectedAnswerIndex != null
                      ? () {
                          // Use the selected answer index to select the tiebreaker answer
                          state.selectTiebreakerAnswer(currentQuestion
                              .answersList[state.selectedAnswerIndex!]);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                const ResultsScreen(), // Re-use ResultsScreen to display final major
                          ));
                        }
                      : null, // Disable button if no answer is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.9),
                    padding: const EdgeInsets.all(15),
                  ),

                  child: Text(
                    'Next',
                    style: GoogleFonts.oswald(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isDesktop: isDesktop);
  }

  Widget desktopLayout(
      StateModel state, bool isDesktop, QuizQuestion currentQuestion, context) {
    //final currentQuestion = state.getCurrentQuestion();
    return styledQuestionContainer(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Final Question: ${currentQuestion.questionText}',
                      style: GoogleFonts.oswald(
                        fontSize: 55,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centers the ListView vertically
                    children: List.generate(currentQuestion.answersList.length,
                        (index) {
                      return RadioListTile<int>(
                        title: Text(
                          currentQuestion.answersList[index],
                          style: GoogleFonts.oswald(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        value: index,
                        groupValue: state.selectedAnswerIndex,
                        onChanged: (int? value) {
                          if (value != null) {
                            state.selectAnswer(value);
                          }
                        },
                      );
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: state.selectedAnswerIndex != null
                      ? () {
                          // Use the selected answer index to select the tiebreaker answer
                          state.selectTiebreakerAnswer(currentQuestion
                              .answersList[state.selectedAnswerIndex!]);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                const ResultsScreen(), // Re-use ResultsScreen to display final major
                          ));
                        }
                      : null, // Disable button if no answer is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.9),
                    padding: const EdgeInsets.all(15),
                  ),

                  child: Text(
                    'Next',
                    style: GoogleFonts.oswald(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        isDesktop: isDesktop);
  }
}
