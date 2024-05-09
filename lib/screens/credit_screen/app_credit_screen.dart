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
          child: isDesktop ? desktopLayout(context) : mobileTabletLayout(context),
        ),
        "assets/images/background.jpg"
      ),
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
                style: GoogleFonts.oswald(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text(
                'This application was made possible by the dedicated efforts of the following individuals:',
                style: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            ...List.generate(10, (index) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Contributor ${index + 1}',
                  style: GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      isDesktop: true
    );
  }

  Widget mobileTabletLayout(BuildContext context) {
    return styledQuestionContainer(
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Credits',
                style: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'This application was made possible by the dedicated efforts of the following individuals:',
                style: GoogleFonts.oswald(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            ...List.generate(10, (index) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Contributor ${index + 1}',
                  style: GoogleFonts.oswald(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      isDesktop: false
    );
  }
}
