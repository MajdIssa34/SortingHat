import 'package:five_guys_plus_one/screens/app_questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:five_guys_plus_one/models/state.dart';

void main() {
  group('QuestionsScreen Tests', () {
    // Helper function to create a testable widget with StateModel provided
    Widget createTestableWidget(Widget child) {
      return MaterialApp(
        home: ChangeNotifierProvider<StateModel>(
          create: (_) => StateModel(),
          child: child,
        ),
      );
    }

    testWidgets('Next button triggers state change when an answer is selected', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(const QuestionsScreen()));
      await tester.pumpAndSettle(); // Wait for all animations and initializations

      // Assuming StateModel is accessible and has initial state set up correctly
      var state = Provider.of<StateModel>(tester.element(find.byType(QuestionsScreen)), listen: false);

      // Simulate selecting an answer
      state.selectAnswer(0); // Assume 0 is a valid answer index
      await tester.pumpAndSettle(); // Update UI and state after selection

      // Verify initial state if necessary
      expect(state.currentQuestionNumber, 1); // Assuming the quiz starts at question number 1

      // Find and tap the 'Next' button if it's enabled
      final nextButton = find.widgetWithText(ElevatedButton, 'Next');
      expect(nextButton, findsOneWidget);
      await tester.tap(nextButton);
      await tester.pumpAndSettle(); // Process the tap and navigate

      // Verify that the state has advanced
      expect(state.currentQuestionNumber, greaterThan(1));
    });
    testWidgets('Back button is disabled on the first question', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(const QuestionsScreen()));

      // Back button should be disabled on the first question
      final backButton = find.widgetWithText(ElevatedButton, 'Back');
      expect(backButton, findsOneWidget);
      final ElevatedButton backBtn = tester.widget(backButton);
      expect(backBtn.onPressed, isNull);  // onPressed should be null if disabled
    });

    testWidgets('Displays correct answer options', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(const QuestionsScreen()));

      // Assume getCurrentQuestion returns a specific question with specific answers
      expect(find.byType(RadioListTile<int>), findsWidgets);  // Should find multiple RadioListTiles for answers
    });

    testWidgets('Radio buttons update selection on tap', (WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget(const QuestionsScreen()));
      await tester.pumpAndSettle(); // Ensure all animations and rendering are complete.

      // Assuming the first RadioListTile<int> is rendered and accessible
      final firstAnswer = find.byType(RadioListTile<int>).first;
      expect(firstAnswer, findsOneWidget);

      // Access StateModel directly from the Provider
      StateModel state = Provider.of<StateModel>(tester.element(firstAnswer), listen: false);

      // Simulate tapping an answer
      await tester.tap(firstAnswer);
      await tester.pump(); // Trigger a frame

      // Verify state has updated
      expect(state.selectedAnswerIndex, isNotNull);
    });
  });
}
