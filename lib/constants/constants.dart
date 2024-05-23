import 'package:five_guys_plus_one/models/state.dart';
import 'package:five_guys_plus_one/screens/app_credit_screen.dart';
import 'package:five_guys_plus_one/screens/app_home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';

var defaultBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
var appBarColor = const Color.fromARGB(255, 255, 255, 255);
var myAppBar = AppBar(
  toolbarHeight: 100,
  backgroundColor: Colors.white,
  title: Center(
    child: Image.asset(
      'assets/images/Macquarie_University Logo2.png',
      fit: BoxFit.contain,
      height: 110, // Adjust the size according to your needs
    ),
  ),
  centerTitle: true,
);
var tilePadding = const EdgeInsets.all(20);

Widget buildMyDrawer(BuildContext context, int index, StateModel model) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/Macquarie_University Logo2.png', // Ensure this path is correct
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                title: Text(
                  '"Any sufficiently advanced technology is indistinguishable from magic."',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse(
                  "https://coursehandbook.mq.edu.au/browse/By%20Faculty/FacultyofScienceandEngineering"),
              builder: (context, followLink) => ElevatedButton(
                onPressed: followLink,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                  shape: const StadiumBorder(),
                  fixedSize: const Size(250, 50),
                ),
                child: Text(
                  "MQ COURSE HANDBOOK",
                  style: GoogleFonts.bebasNeue(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse("https://www.mq.edu.au/"),
              builder: (context, followLink) => ElevatedButton(
                onPressed: followLink,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                  shape: const StadiumBorder(),
                  fixedSize: const Size(250, 50),
                ),
                child: Text("MQ WEBSITE",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                if (index != 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                } else {
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                shape: const StadiumBorder(),
                fixedSize: const Size(250, 50),
              ),
              child: Text("HOME",
                  style: GoogleFonts.bebasNeue(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreditScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                shape: const StadiumBorder(),
                fixedSize: const Size(250, 50),
              ),
              child: Text("CREDITS",
                  style: GoogleFonts.bebasNeue(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                model.resetQuizQuestion();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                shape: const StadiumBorder(),
                fixedSize: const Size(250, 50),
              ),
              child: Text("RESET QUIZ",
                  style: GoogleFonts.bebasNeue(
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    ),
  );
}

Widget background(Widget child, String str) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(str),
        fit: BoxFit.cover,
      ),
    ),
    child: SafeArea(child: child),
  );
}

Widget styledQuestionContainer(Widget child, {required bool isDesktop}) {
  return Padding(
    padding: EdgeInsets.all(isDesktop ? 40 : 20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
        //border: Border.all(color: Colors.white, width: 2),
      ),
      child: child,
    ),
  );
}

Widget styledElevatedButton(String text, VoidCallback? onPressed,
    {required bool isDesktop}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.withOpacity(0.7),
      padding: EdgeInsets.all(isDesktop ? 25 : 15),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: isDesktop ? 25 : 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
