import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: myAppBar,
    backgroundColor: Colors.transparent, // Set background color to transparent
    drawer: myDrawer,
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background2.jpg'), // Replace with your desired background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              //alignment: Alignment.topLeft,
              'assets/images/Macquarie_University Logo.png',
              width: 600,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                '"Any sufficiently advanced technology is indistinguishable from magic."',
                style: GoogleFonts.bebasNeue(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(-10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextButton(
                onPressed: startQuiz,
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 48, 45, 45),
                  padding: const EdgeInsets.all(25),
                ),
                child: Text(
                  "Start the Quiz",
                  style: GoogleFonts.bebasNeue(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );;
  }
}
