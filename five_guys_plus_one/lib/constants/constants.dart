
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/material.dart';

var defaultBackgroundColor = Color.fromARGB(255, 255, 255, 255);
var appBarColor = const Color.fromARGB(255, 255, 255, 255);
var myAppBar = AppBar(
  backgroundColor: Colors.white,
  title: Text('F I V E  G U Y S + 1',
    style: GoogleFonts.bebasNeue(
                  //textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
  )),
  centerTitle: true,
);
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  elevation: 0,
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
          leading: const Icon(Icons.home),
          title: Text(
            'M A J D  I S S A  G I T H U B',
            style: drawerTextColor,
          ),
        ),
      ),
      Link(
        target: LinkTarget.blank,
        uri: Uri.parse("https://github.com/MajdIssa34/WeatherApp.git"),
        builder: (context, followLink) => ElevatedButton(
          onPressed: followLink,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 54, 54, 54),
            shape: const StadiumBorder(),
            fixedSize: const Size(250, 50),
          ),
          child: const Text(
            "W  E  A  T  H  E  R    A  P  P  !",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 54, 54, 54),
          shape: const StadiumBorder(),
          fixedSize: const Size(250, 50),
        ),
        child: const Text(
          "M A J D !",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            )
          ),
      ),
    ],
  ),
);