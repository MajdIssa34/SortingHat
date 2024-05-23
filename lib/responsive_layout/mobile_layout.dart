import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/information_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: myAppBar,
          backgroundColor:
              Colors.transparent, // Set background color to transparent
          drawer: buildMyDrawer(context, 0, StateModel()),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        'MQ School of Computing Pathway Finder!',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 50,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center, // Center the text
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(-10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntermediateScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.9),
                          padding: const EdgeInsets.all(25),
                        ),
                        child: Text(
                          "Start",
                          style: GoogleFonts.bebasNeue(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
