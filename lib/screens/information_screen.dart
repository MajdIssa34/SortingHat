import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/app_quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/models/state.dart';

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Define background images
    final String backgroundImage = screenWidth > 800
        ? 'assets/images/InfoBackgroundDesktop.webp' // Desktop background image
        : 'assets/images/InfoBackgroundMobile.webp'; // Mobile background image

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight
          ),
        ),
        child: Center(
          child: screenWidth > 800
              ? desktopLayout(context)
              : mobileLayout(context),
        ),
      ),
    );
  }

  Widget desktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Welcome to MQ School of Computing! THIS headset will guide you in selecting an MQ school of Computing Major/Degree.',
              style: GoogleFonts.poppins(
                    fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Start the quiz
                Provider.of<StateModel>(context, listen: false).startQuiz();
                // Navigate to the Quiz screen if necessary
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Quiz()), // Ensure you have a Quiz widget or screen to navigate to
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(160, 40),
                foregroundColor: const Color(0xffF2D3AC),
                  backgroundColor: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  )),
                child:
                    Text('Find my Path', style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ), ),
            ),
          ),
        ],
      ),
    );
    
  }

  Widget mobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to MQ School of Computing! THIS headset will guide you in selecting an MQ school of Computing Major/Degree.',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 400),
            ElevatedButton(
              onPressed: () {
                // Start the quiz
                Provider.of<StateModel>(context, listen: false).startQuiz();
                // Navigate to the Quiz screen if necessary
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Quiz()), // Ensure you have a Quiz widget or screen to navigate to
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(160, 40),
              foregroundColor: const Color(0xffF2D3AC),
                backgroundColor: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                )),
              child:
                  Text('Find my Path', style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ), ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonLayout(BuildContext context,
      {required double fontSize, required Size buttonSize}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Get ready to explore your future major!',
            style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Start the quiz
              Provider.of<StateModel>(context, listen: false).startQuiz();
              // Navigate to the Quiz screen if necessary
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Quiz()), // Ensure you have a Quiz widget or screen to navigate to
              );
            },
            style: ElevatedButton.styleFrom(minimumSize: buttonSize),
            child: Text('Find my Path',
                style: TextStyle(fontSize: fontSize * 0.75)),
          ),
        ],
      ),
    );
  }
}
