import 'package:five_guys_plus_one/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/constants/constants.dart'; // Ensure path is correct

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    return Consumer<StateModel>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: myAppBar,
          drawer: buildMyDrawer(context, 1, state),
          body: background(
            Center(
              child: isDesktop
                  ? desktopLayout(state, isDesktop, state.getCurrentQuestion())
                  : mobileTabletLayout(state, isDesktop, state.getCurrentQuestion()),
            ),
            "assets/images/background.jpg"
          ),
        );
      },
    );
  }

  //function to build a progress bar
  Widget buildProgressBar(StateModel state) {
    return LinearProgressIndicator(
      value: state.progress,
      backgroundColor: Colors.grey[300],
      valueColor:
          const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 149, 25, 25)),
      minHeight: 10, // Adjust the height of the progress bar
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget mobileTabletLayout(StateModel state, bool isDesktop, QuizQuestion currentQuestion) {
    //final currentQuestion = state.getCurrentQuestion();
    return styledQuestionContainer(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildProgressBar(state),
        Text(
          'Question ${state.currentQuestionNumber}: ${currentQuestion.questionText}',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
          Flexible(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling within the ListView itself
                itemCount: currentQuestion.answersList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    title: Text(
                      currentQuestion.answersList[index],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    value: index,
                    groupValue: state.selectedAnswerIndex,
                    onChanged: (int? value) {
                      if (value != null) {
                        state.selectAnswer(value);
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: state.currentQuestionNumber > 1
                        ? () {
                            state.goBack();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.7),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text(
                      'Back',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: state.selectedAnswerIndex != null
                      ? () {
                          state.confirmAndAdvanceQuestion();
                        }
                      : null,
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
              ],
            ),
          ),
        ],
      ),
      isDesktop: isDesktop
    );
  }

  Widget desktopLayout(StateModel state, bool isDesktop, QuizQuestion currentQuestion) {
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
                        buildProgressBar(state),
                        Text(
                          'Question ${state.currentQuestionNumber}: ${currentQuestion.questionText}',
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
                            textAlign: TextAlign.start,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: state.currentQuestionNumber > 1
                              ? () {
                                  state.goBack();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.7),
                            padding: const EdgeInsets.all(15),
                          ),
                          child: Text(
                            'Back',
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: state.selectedAnswerIndex != null
                              ? () {
                                  state.confirmAndAdvanceQuestion();
                                }
                              : null,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          isDesktop: isDesktop
        );
  }
}
