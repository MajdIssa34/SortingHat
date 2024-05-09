import 'package:five_guys_plus_one/models/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StateModel Tests', () {
    test('Select Answer updates _selectedAnswerIndex and notifies listeners',
        () {
      final state = StateModel();
      var isNotified = false;
      state.addListener(() => isNotified = true);

      state.selectAnswer(1);

      expect(state.selectedAnswerIndex, 1);
      expect(isNotified, true);
    });

    test('Confirm and advance should update the current question index', () {
      final state = StateModel();
      state.selectAnswer(1); // Assuming a correct answer to allow advancing
      var oldQuestionIndex = state.currentQuestionNumber;

      state.confirmAndAdvanceQuestion();

      expect(state.currentQuestionNumber, isNot(oldQuestionIndex));
    });

    test('Reset Quiz should clear selectedAnswerIndex and reset question index',
        () {
      final state = StateModel();
      state.selectAnswer(1);
      state.confirmAndAdvanceQuestion();

      state.resetQuiz();

      expect(state.selectedAnswerIndex, isNull);
      expect(state.currentQuestionNumber, 1);
    });

    // Assuming there is a method to calculate scores or results
  });
}
