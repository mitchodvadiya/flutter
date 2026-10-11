import 'package:flutter_test/flutter_test.dart';

import 'package:experiment_4/main.dart';

void main() {
  testWidgets('shows income, expenses, balance, and transactions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Income Tracker'), findsOneWidget);
    expect(find.text('Total Income'), findsOneWidget);
    expect(find.text('₹30000'), findsOneWidget);
    expect(find.text('Total Expense'), findsOneWidget);
    expect(find.text('₹1500'), findsOneWidget);
    expect(find.text('Balance'), findsOneWidget);
    expect(find.text('₹28500'), findsOneWidget);
    expect(find.text('Salary'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Travel'), findsOneWidget);
  });
}
