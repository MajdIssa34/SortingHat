import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget questionnaireBackground(Widget child) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.jpg"),
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
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8.0),
        //border: Border.all(color: Colors.white, width: 2),
      ),
      child: child,
    ),
  );
}


Widget styledElevatedButton(String text, VoidCallback? onPressed, {required bool isDesktop}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.withOpacity(0.7),
      padding: EdgeInsets.all(isDesktop ? 25 : 15),
    ),
    child: Text(
      text,
      style: GoogleFonts.oswald(
        fontSize: isDesktop ? 25 : 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}

