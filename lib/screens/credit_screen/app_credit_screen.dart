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
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  'Credits',
                  style: GoogleFonts.oswald(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: Text(
                  'This application was made possible by the dedicated efforts of the following individuals:',
                  style: GoogleFonts.oswald(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              ...List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Contributor ${index + 1}',
                    style: GoogleFonts.oswald(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        isDesktop: true);
  }

  Widget mobileTabletLayout(BuildContext context) {
    return styledQuestionContainer(
          Column(
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
              boldText('Team Leader/Scrum Master:'),
              normalText("Elias Hawly"),
              const SizedBox(
                height: 10,
              ),
              boldText("Team Quality Manager:"),
              normalText('Alex Folia'),
              const SizedBox(
                height: 10,
              ),
              boldText("Developer:"),
              normalText("Majd Issa"),
              const SizedBox(
                height: 10,
              ),
              boldText("Designers/Writers:"),
              normalText('Callum Walton, Yuzhou Niu, Xinhao Wu'),
              const SizedBox(
                height: 10,
              ),
              boldText('Product Owner:'),
              normalText('MQ Outreach'),
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
              boldText('Acknowledgements:'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: normalText('We would like to thank the MQ School of Computing for their support and resources, making this project possible. Special thanks to all our team members for their dedication and hard work.'),
              )
            ],
          ),
      
        isDesktop: false);
  }
}

Widget boldText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    textAlign: TextAlign.center,
  );
}
Widget normalText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: 16, color: Colors.black),
    textAlign: TextAlign.center,
  );
}
