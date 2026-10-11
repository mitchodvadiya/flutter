import 'package:flutter/material.dart';
import '../models/transaction.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<Transaction> transactions = [
    Transaction(
      title: 'Salary',
      amount: 30000,
      isIncome: true,
    ),
    Transaction(
      title: 'Food',
      amount: 500,
      isIncome: false,
    ),
    Transaction(
      title: 'Travel',
      amount: 1000,
      isIncome: false,
    ),
  ];

  double get totalIncome {
    double total = 0;

    for (var transaction in transactions) {
      if (transaction.isIncome) {
        total += transaction.amount;
      }
    }

    return total;
  }

  double get totalExpense {
    double total = 0;

    for (var transaction in transactions) {
      if (!transaction.isIncome) {
        total += transaction.amount;
      }
    }

    return total;
  }

  double get balance {
    return totalIncome - totalExpense;
  }

  void addTransaction() {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    bool isIncome = true;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add Transaction'),

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

                  SwitchListTile(
                    title: const Text('Income'),
                    value: isIncome,
                    onChanged: (value) {
                      setDialogState(() {
                        isIncome = value;
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
                      transactions.add(
                        Transaction(
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          isIncome: isIncome,
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
        title: const Text('Income Tracker'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addTransaction,
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // Total Income
            Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_downward),
                title: const Text('Total Income'),
                trailing: Text(
                  '₹${totalIncome.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // Total Expense
            Card(
              child: ListTile(
                leading: const Icon(Icons.arrow_upward),
                title: const Text('Total Expense'),
                trailing: Text(
                  '₹${totalExpense.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            // Balance
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_balance),
                title: const Text('Balance'),
                trailing: Text(
                  '₹${balance.toStringAsFixed(0)}',
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
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ...transactions.map(
              (transaction) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      transaction.isIncome
                          ? Icons.add_circle
                          : Icons.remove_circle,
                    ),

                    title: Text(transaction.title),

                    trailing: Text(
                      '${transaction.isIncome ? '+' : '-'} ₹${transaction.amount.toStringAsFixed(0)}',
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