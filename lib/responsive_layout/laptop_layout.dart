import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaptopLayout extends StatelessWidget {
  const LaptopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<StateModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: myAppBar,
            drawer: myDrawer,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background4.jpg'), // Replace with your desired background image
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Macquarie_University Logo.png',
                      width: 600,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(35),
                            child: Column(children: [
                              Text(
                                'This is what is going to happen, you will place the MAGIC BEANIE on your head, and it will ask you some questions. After answering all of the questions, it will suggest a major that suits you.',
                                style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center, // Center the text
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(-10),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 255, 255, 255)
                                              .withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: value.startQuiz,
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 48, 45, 45),
                                    padding: const EdgeInsets.all(25),
                                  ),
                                  child: Text(
                                    "Start the Quiz",
                                    style: GoogleFonts.bebasNeue(
                                      textStyle:
                                          Theme.of(context).textTheme.displayLarge,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
