import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:electricity_bill_app/main.dart';

void main() {
  testWidgets('Electricity bill calculation works', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ElectricityBillApp());

    // Enter 250 units
    await tester.enterText(find.byType(TextField), '250');

    // Press Calculate Bill
    await tester.tap(find.text('Calculate Bill'));

    // Wait for UI update
    await tester.pumpAndSettle();

    // Check results
    expect(find.text('250 Units'), findsOneWidget);
    expect(find.text('₹ 600.00'), findsOneWidget);
  });

  testWidgets('Clear button resets the bill', (WidgetTester tester) async {
    await tester.pumpWidget(const ElectricityBillApp());

    // Enter 150 units
    await tester.enterText(find.byType(TextField), '150');

    // Calculate
    await tester.tap(find.text('Calculate Bill'));
    await tester.pumpAndSettle();

    // Clear
    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();

    // Check that values are reset
    expect(find.text('0 Units'), findsOneWidget);
    expect(find.text('₹ 0.00'), findsOneWidget);
  });
}
