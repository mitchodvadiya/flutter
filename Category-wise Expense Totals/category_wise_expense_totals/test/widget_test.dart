import 'package:flutter_test/flutter_test.dart';

import 'package:category_wise_expense_totals/main.dart';

void main() {
  testWidgets('shows category totals and highest expense', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Category-wise Expenses'), findsOneWidget);
    expect(find.text('Food'), findsNWidgets(3));
    expect(find.text('₹1200'), findsOneWidget);
    expect(find.text('Travel'), findsNWidgets(2));
    expect(find.text('₹300'), findsNWidgets(2));
    expect(find.text('Highest Expense Category'), findsOneWidget);
    expect(find.text('Shopping'), findsNWidgets(3));
  });
}
