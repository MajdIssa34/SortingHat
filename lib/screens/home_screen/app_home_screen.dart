import 'package:five_guys_plus_one/responsive_layout/mobile_layout.dart';
import 'package:five_guys_plus_one/responsive_layout/responsive_layout.dart';
import 'package:five_guys_plus_one/responsive_layout/laptop_layout.dart';
import 'package:five_guys_plus_one/responsive_layout/tablet_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return const ResponsiveLayout(
      mobileScaffold: MobileLayout(),
      laptopScaffold: LaptopLayout(),
      tabletScaffold: TabletLayout(),
    );
  }
}
