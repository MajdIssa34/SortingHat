import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget laptopScaffold;
  final Widget tabletScaffold;

  const ResponsiveLayout({super.key, 
    required this.mobileScaffold,
    required this.laptopScaffold,
    required this.tabletScaffold,
  });


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < 750){
        return mobileScaffold;
      }  
      else if (constraints.maxWidth < 1250){
        return tabletScaffold;
      }
      else{
        return laptopScaffold;
      }
    },
    );
  }
}