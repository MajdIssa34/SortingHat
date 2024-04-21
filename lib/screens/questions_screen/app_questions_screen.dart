import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/constants/app_answer_button.dart'; // Ensure this path is correct

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<StateModel>(
      builder: (context, state, child) {
        return Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/background.jpg"), // Use an appropriate image
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: screenWidth < 800
                  ? mobileTabletLayout(state)
                  : desktopLayout(state),
            ),
          ),
        ));
      },
    );
  }

  Widget mobileTabletLayout(StateModel state) {
    final currentQuestion = state.getCurrentQuestion();
    return Center(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    currentQuestion.questionText,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  // Ensures only the ListView is scrollable
                  child: ListView.builder(
                    itemCount: currentQuestion.answersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: AnswerButton(
                          answerText: currentQuestion.answersList[index],
                          onAnswerSelect: () {
                            state.addAnswer(
                              currentQuestion.answersList[index],
                              currentQuestion.keys[index],
                            );
                            state.advanceQuestion();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

 Widget desktopLayout(StateModel state) {
  final currentQuestion = state.getCurrentQuestion();
  return Center(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          constraints: const BoxConstraints(minWidth: 1000, minHeight: 1000),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center content vertically in the column
                    crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally in the column
                    children: [
                      Text(
                        'Question ${state.currentQuestionNumber}:',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        currentQuestion.questionText,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Ensure vertical centering
                      crossAxisAlignment: CrossAxisAlignment.center, // Ensure horizontal centering
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                          currentQuestion.answersList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: AnswerButton(
                            answerText: currentQuestion.answersList[index],
                            onAnswerSelect: () {
                              state.addAnswer(
                                currentQuestion.answersList[index],
                                currentQuestion.keys[index],
                              );
                              state.advanceQuestion();
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

}



