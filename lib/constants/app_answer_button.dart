import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answerText, required this.onAnswerSelect});

  final String answerText;
  final void Function() onAnswerSelect;

  @override
  Widget build(context) {
    return ElevatedButton(
            onPressed: onAnswerSelect, 
            style: ElevatedButton.styleFrom( 
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              foregroundColor: const Color(0xffF2D3AC),
              backgroundColor: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
              )
            ),
            child: Text(
              answerText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ), 
              textAlign: TextAlign.center,)
          );
  }
}