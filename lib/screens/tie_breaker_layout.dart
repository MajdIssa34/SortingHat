import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/final_screen_decider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Final Question: ${currentQuestion.questionText}',
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
                          style: GoogleFonts.poppins(
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
                    style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                      fontSize: 16,
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
                            style: GoogleFonts.poppins(
                              fontSize: 12,
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
                    style: GoogleFonts.poppins(
                      fontSize: 16,
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
