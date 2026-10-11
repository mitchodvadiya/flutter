// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:employee_salary_calculator/main.dart';

void main() {
  testWidgets('Salary app loads and displays calculator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SalaryApp());

    expect(find.text('Employee Salary Calculator'), findsWidgets);
    expect(find.text('Enter Basic Salary'), findsOneWidget);
    expect(find.text('Basic Salary'), findsAtLeastNWidgets(1));
  });
}
