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
  }
}
