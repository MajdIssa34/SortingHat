import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/constants/constants.dart'; // Ensure path is correct

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: myAppBar,
          drawer: buildMyDrawer(context),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: MediaQuery.of(context).size.width < 1000
                    ? mobileTabletLayout(state)
                    : desktopLayout(state),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget mobileTabletLayout(StateModel state) {
    final currentQuestion = state.getCurrentQuestion();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Question ${state.currentQuestionNumber}: ${currentQuestion.questionText}',
                style: GoogleFonts.oswald(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
                    return RadioListTile<int>(
                      title: Text(
                        currentQuestion.answersList[index],
                        style: GoogleFonts.oswald(
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
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
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
                  style: GoogleFonts.oswald(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget desktopLayout(StateModel state) {
    final currentQuestion = state.getCurrentQuestion();
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        constraints: const BoxConstraints(minWidth: 1000, minHeight: 1000),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Row(
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
                      'Question ${state.currentQuestionNumber}: ${currentQuestion.questionText}',
                      style: GoogleFonts.oswald(
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
              padding: const EdgeInsets.all(60),
              child: ElevatedButton(
                onPressed: state.selectedAnswerIndex != null
                    ? () {
                        state.confirmAndAdvanceQuestion();
                      }
                    : null,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.9),
                  padding: const EdgeInsets.all(25),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.oswald(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
