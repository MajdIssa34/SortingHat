import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/constants/constants.dart';
import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/information_screen.dart';

class LaptopLayout extends StatelessWidget {
  const LaptopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<StateModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: myAppBar,
            drawer: buildMyDrawer(context, 0, StateModel()),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(  // Using Row instead of Column
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,  // Adjust flex as needed for better sizing
                        child: Padding(
                          padding: const EdgeInsets.all(100),
                          child: Text(
                            'MQ School of Computing Pathway Finder!',
                            style: GoogleFonts.poppins(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center, // Align text to the left
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,  // Adjust flex as needed for better sizing
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), // Fixed the negative value
                                 
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(450,0,150,0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const IntermediateScreen()),
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 48, 45, 45),
                                padding: const EdgeInsets.all(25),
                              ),
                              child: Text(
                                "Start",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),
                              ),
                              
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
      ),
    );
  }
}
