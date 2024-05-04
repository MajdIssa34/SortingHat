import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/questions_screen/questionnaire_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget mobileResultsScreen(
    BuildContext context, StateModel state, String major, bool isDesktop) {
  //final String majorUrl = state.getMajorUrl(major);
  const String mqHandbookUrl =
      "https://coursehandbook.mq.edu.au/browse/By%20Faculty/FacultyofScienceandEngineering";

  return styledQuestionContainer(
    Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your major is",
              style: GoogleFonts.oswald(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            //const SizedBox(height: 30),
            Text(
              major,
              style: GoogleFonts.oswald(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              state.getDescription(major),
              style: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                // Add your URL launching logic here
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.all(15),
              ),
              child: Text(
                "Open Major Handbook",
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrlString(mqHandbookUrl)) {
                  await launchUrlString(mqHandbookUrl);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.all(15),
              ),
              child: Text(
                "Open MQ Handbook",
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                state.resetQuiz();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.all(15),
              ),
              child: Text(
                "Restart Quiz",
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
    isDesktop: isDesktop,
  );
}

Widget desktopResultsScreen(
    BuildContext context, StateModel state, String major, bool isDesktop) {
  // URLs for the major and the handbook
  //final String majorUrl = state.getMajorUrl(major);
  //final String mqHandbookUrl = state.getMQHandbookUrl();

  return styledQuestionContainer(
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // First column: all text
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Your major is",
                      style: GoogleFonts.oswald(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Text(major,
                      style: GoogleFonts.oswald(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Text(state.getDescription(major),
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
        // Second column: all buttons
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // if (await canLaunchUrl(majorUrl)) {
                  //   await launchUrl(majorUrl);
                  // }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Open Major Handbook",
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  // if (await canLaunchUrl(mqHandbookUrl)) {
                  //   await launchUrl(mqHandbookUrl);
                  // }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Open MQ Handbook",
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  state.resetQuiz();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 50),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Restart Quiz",
                  style: GoogleFonts.oswald(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    isDesktop: isDesktop,
  );
}
