import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';

var defaultBackgroundColor = Color.fromARGB(255, 255, 255, 255);
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
var myDrawer = Drawer(
  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  elevation: 0,
  child: SingleChildScrollView(
    child: Column(
      children: [
        const DrawerHeader(
          child: Icon(
            Icons.favorite,
            size: 64,
          ),
        ),
        Padding(
          padding: tilePadding,
          child: ListTile(
            //leading: const Icon(Icons.home),
            title: Text(
              '"Any sufficiently advanced technology is indistinguishable from magic."',
              style: GoogleFonts.oswald(
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
              "M Q  C O U R S E  H A N D B O O K",
              style: GoogleFonts.bebasNeue(
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
            child: Text("M Q  W E B S I T E !",
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                )),
          ),
        )
      ],
    ),
  ),
);
