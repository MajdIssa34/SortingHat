import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget mobileResultsScreen(
    BuildContext context, StateModel state, String major, bool isDesktop) {
  const String mqHandbookUrl =
      "https://coursehandbook.mq.edu.au/browse/By%20Faculty/FacultyofScienceandEngineering";
  return styledQuestionContainer(
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      // Use LayoutBuilder to manage size
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: constraints.maxHeight), // Ensures it fills the height
          child: IntrinsicHeight(
            // Ensures the column stretches to fit the ConstrainedBox
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Stretch might help depending on your design
                children: [
                  Text(
                    "Your major is",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    major,
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      state.getDescription(major),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      if (await canLaunchUrlString(state.getMajorLink())) {
                        await launchUrlString(state.getMajorLink());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      backgroundColor: Colors.grey.shade600,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text(
                      "Learn More About this Major",
                      style: GoogleFonts.poppins(
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
                      fixedSize: const Size(150, 60),
                      backgroundColor: Colors.grey.shade600,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text(
                      "Open MQ Handbook",
                      style: GoogleFonts.poppins(
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
                      fixedSize: const Size(150, 60),
                      backgroundColor: Colors.grey.shade600,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text(
                      "Restart Quiz",
                      style: GoogleFonts.poppins(
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
        ),
      );
    }),
    isDesktop: isDesktop,
  );
}

Widget desktopResultsScreen(
    BuildContext context, StateModel state, String major, bool isDesktop) {
  const String mqHandbookUrl =
      "https://coursehandbook.mq.edu.au/browse/By%20Faculty/FacultyofScienceandEngineering";
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
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Text(major,
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Text(state.getDescription(major),
                      style: GoogleFonts.poppins(
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
          padding: const EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrlString(state.getMajorLink())) {
                    await launchUrlString(state.getMajorLink());
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 70),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Learn More About this Major",
                  style: GoogleFonts.poppins(
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
                  if (await canLaunchUrlString(mqHandbookUrl)) {
                    await launchUrlString(mqHandbookUrl);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 70),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Open MQ Handbook",
                  style: GoogleFonts.poppins(
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
                  fixedSize: const Size(250, 70),
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: Text(
                  "Restart Quiz",
                  style: GoogleFonts.poppins(
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
