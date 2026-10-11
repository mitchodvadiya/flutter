import 'package:flutter/material.dart';
import '../models/expense.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Expense> expenses = [
    Expense(
      title: 'Lunch',
      amount: 500,
      category: 'Food',
    ),
    Expense(
      title: 'Dinner',
      amount: 700,
      category: 'Food',
    ),
    Expense(
      title: 'Bus',
      amount: 300,
      category: 'Travel',
    ),
    Expense(
      title: 'Shoes',
      amount: 1500,
      category: 'Shopping',
    ),
    Expense(
      title: 'Books',
      amount: 800,
      category: 'Education',
    ),
  ];

  // Calculate category-wise totals
  Map<String, double> get categoryTotals {
    Map<String, double> totals = {};

    for (var expense in expenses) {
      if (totals.containsKey(expense.category)) {
        totals[expense.category] =
            totals[expense.category]! + expense.amount;
      } else {
        totals[expense.category] = expense.amount;
      }
    }

    return totals;
  }

  // Find highest expense category
  String get highestCategory {
    if (categoryTotals.isEmpty) {
      return 'No expenses';
    }

    String category = '';
    double highest = 0;

    categoryTotals.forEach((key, value) {
      if (value > highest) {
        highest = value;
        category = key;
      }
    });

    return category;
  }

  double get highestAmount {
    if (categoryTotals.isEmpty) {
      return 0;
    }

    double highest = 0;

    categoryTotals.forEach((key, value) {
      if (value > highest) {
        highest = value;
      }
    });

    return highest;
  }

  void addExpense() {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    String category = 'Food';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Expense'),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),

                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),

                  DropdownButton<String>(
                    value: category,
                    isExpanded: true,

                    items: const [
                      DropdownMenuItem(
                        value: 'Food',
                        child: Text('Food'),
                      ),
                      DropdownMenuItem(
                        value: 'Travel',
                        child: Text('Travel'),
                      ),
                      DropdownMenuItem(
                        value: 'Shopping',
                        child: Text('Shopping'),
                      ),
                      DropdownMenuItem(
                        value: 'Education',
                        child: Text('Education'),
                      ),
                    ],

                    onChanged: (value) {
                      setDialogState(() {
                        category = value!;
                      });
                    },
                  ),
                ],
              ),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        amountController.text.isEmpty) {
                      return;
                    }

                    setState(() {
                      expenses.add(
                        Expense(
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          category: category,
                        ),
                      );
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category-wise Expenses'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addExpense,
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Expense by Category',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Category totals
            ...categoryTotals.entries.map(
              (entry) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.category),

                    title: Text(entry.key),

                    trailing: Text(
                      '₹${entry.value.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Highest category
            Card(
              child: ListTile(
                leading: const Icon(Icons.star),

                title: const Text(
                  'Highest Expense Category',
                ),

                subtitle: Text(
                  highestCategory,
                ),

                trailing: Text(
                  '₹${highestAmount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Expenses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ...expenses.map(
              (expense) {
                return Card(
                  child: ListTile(
                    title: Text(expense.title),

                    subtitle: Text(expense.category),

                    trailing: Text(
                      '₹${expense.amount.toStringAsFixed(0)}',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}