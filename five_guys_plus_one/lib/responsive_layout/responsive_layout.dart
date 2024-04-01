import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget laptopScaffold;

  const ResponsiveLayout({super.key, 
    required this.mobileScaffold,
    //required this.tabletScaffold,
    required this.laptopScaffold,
  });


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < 700){
        return mobileScaffold;
      }  
      else{
        return laptopScaffold;
      }
    },
    );
  }
}