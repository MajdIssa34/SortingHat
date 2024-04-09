import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  const SummarySection(this.displayData, {super.key});

  final List<Map<String, Object>> displayData;

  bool isCorrectAnswer(String userInput, String correctAnswer) {
    return userInput == correctAnswer ? true : false;
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: displayData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ((data['questionIndex'] as int) + 1).toString(),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D0A09),
                          ),
                        ),
                        Text(
                          data['chosenAnswer'] as String,
                          style: const TextStyle(
                            color: Color(0xff732C02),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data['chosenKeys'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2C4001),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}