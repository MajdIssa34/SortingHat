import 'package:five_guys_plus_one/responsive_layout/mobile_layout.dart';
import 'package:five_guys_plus_one/responsive_layout/responsive_layout.dart';
import 'package:five_guys_plus_one/responsive_layout/tablet_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return ResponsiveLayout(
      mobileScaffold: MobileLayout(startQuiz), 
      tabletScaffold: TabletLayout(startQuiz) , 
      laptopScaffold: Text(""),
    );   
    // return Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Image.asset(
    //         'assets\\images\\Macquarie_University Logo.png',
    //         width: 300,
    //       ),
    //       const SizedBox(height: 30),
    //       const Text(
    //         "Harry Potter Quiz App",
    //         style: TextStyle(
    //           color: Color(0xff401201),
    //           fontSize: 22,
    //         ),
    //       ),
    //       const SizedBox(height: 30),
    //       OutlinedButton.icon(
    //           icon: const Icon(Icons.arrow_right_alt_rounded),
    //           style: OutlinedButton.styleFrom(
    //             foregroundColor: const Color(0xff401201),  
    //           ),
    //           onPressed: startQuiz,
    //           label: const Text(
    //             "Start the Quiz",
    //             style: TextStyle(
    //               fontSize: 16,
    //             ),
    //           ))
    //     ],
    //   ),
    // );
  }
}
