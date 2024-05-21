import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    return Scaffold(
      appBar: myAppBar,
      body: background(
          Center(
            child: isDesktop
                ? desktopLayout(context)
                : mobileTabletLayout(context),
          ),
          "assets/images/background.jpg"),
    );
  }

  Widget desktopLayout(BuildContext context) {
    return styledQuestionContainer(
        LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: constraints
                  .maxHeight), // Ensure the container fills the vertical space
          child: IntrinsicHeight(
            // Allows the content to stretch in height if needed
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Credits',
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 2, color: Colors.black),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        boldText('Team Leader/Scrum Master:',24),
                        normalText("Elias Swaiy",24),
                        normalText('Organizing scrums and sprints, overall team coordination.',24),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            boldText("Team Quality Manager:",24),
                            normalText('Alex Folia',24),
                            normalText('Quality assurance and control.',24),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            boldText("Developer:",24),
                            normalText("Majd Issa",24),
                            normalText('Product development and coding.',24)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            boldText("Designers/Writers:",24),
                            normalText('Callum Walton, Yuzhou Niu, Xinhao Wu',24),
                            normalText('Product design, documentation creation and management.',24)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            boldText('Product Owner:',24),
                            normalText('MQ Outreach and Engagement',24),
                            normalText(' Represents the stakeholders, guiding the project\'s objectives and deliverables.',24),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 2, color: Colors.black),
                  const SizedBox(height: 10),
                  Center(
                    child: boldText('Acknowledgements:',24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: normalText(
                          'We would like to thank the MQ School of Computing for their support and resources, making this project possible. Special thanks to all our team members for their dedication and hard work.',24),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }),
        isDesktop:
            true // Assuming styledQuestionContainer uses this flag to apply styles
        );
  }

  Widget mobileTabletLayout(BuildContext context) {
    return styledQuestionContainer(
        LayoutBuilder(builder: (context, constraints) {
      // Use LayoutBuilder to get actual size constraints
      return SingleChildScrollView(
        // This will allow the content to be scrollable
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: constraints
                  .maxHeight), // Ensure the container at least fills the screen
          child: IntrinsicHeight(
            // Ensures the Column fills the space when less content is available
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Credits',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                boldText('Team Leader/Scrum Master:',16),
                normalText("Elias Swaiy",16),
                const SizedBox(
                  height: 10,
                ),
                boldText("Team Quality Manager:",16),
                normalText('Alex Folia',16),
                const SizedBox(
                  height: 10,
                ),
                boldText("Developer:",16),
                normalText("Majd Issa",16),
                const SizedBox(
                  height: 10,
                ),
                boldText("Designers/Writers:",16),
                normalText('Callum Walton, Yuzhou Niu, Xinhao Wu',16),
                const SizedBox(
                  height: 10,
                ),
                boldText('Product Owner:',16),
                normalText('MQ Outreach and Engagement',16),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                boldText('Acknowledgements:',16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: normalText(
                      'We would like to thank the MQ School of Computing for their support and resources, making this project possible. Special thanks to all our team members for their dedication and hard work.',16),
                )
              ],
            ),
          ),
        ),
      );
    }), isDesktop: false);
  }
}

Widget boldText(String text, double textSize) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: textSize, fontWeight: FontWeight.bold, color: Colors.black),
    textAlign: TextAlign.center,
  );
}

Widget normalText(String text, double textSize) {
  return Text(
    text,
    style: GoogleFonts.poppins(fontSize: textSize, color: Colors.black),
    textAlign: TextAlign.center,
  );
}
