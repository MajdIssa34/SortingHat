import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter/material.dart';
import 'package:five_guys_plus_one/models/app_quiz.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StateModel(),
      child: const Quiz(),
    )
  );
}
