import 'package:five_guys_plus_one/screens/app_credit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Helper function to create a testable widget
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  group('CreditScreen Tests', () {
    testWidgets('Displays correct text and layout for desktop',
        (WidgetTester tester) async {
      // Set the physical size for desktop

      tester.view.devicePixelRatio =
          1.0; // Optional: Set this if you need specific DPI settings

      tester.binding.platformDispatcher.views.first.physicalSize =
          const Size(1200, 800);

      await tester.pumpWidget(makeTestableWidget(child: const CreditScreen()));
      await tester.pumpAndSettle();

      // Verify that the desktop layout text and style are applied correctly
      expect(find.text('Credits'), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(tester.widget<Text>(find.text('Credits')).style!.fontSize, 28);
      expect(find.text('Elias Hawly'), findsOneWidget);
      expect(find.text('MQ Outreach'), findsOneWidget);
    });

    testWidgets('Displays correct text and layout for mobile/tablet',
        (WidgetTester tester) async {
      // Set the physical size for mobile

      tester.view.devicePixelRatio = 1.0;

      tester.binding.platformDispatcher.views.first.physicalSize =
          const Size(360, 640);

      await tester.pumpWidget(makeTestableWidget(child: const CreditScreen()));
      await tester.pumpAndSettle();

      // Verify that the mobile layout text and style are applied correctly
      expect(find.text('Credits'), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(tester.widget<Text>(find.text('Credits')).style!.fontSize, 24);
      expect(find.text('Elias Hawly'), findsOneWidget);
      expect(find.text('MQ Outreach'), findsOneWidget);
    });
  });
}
