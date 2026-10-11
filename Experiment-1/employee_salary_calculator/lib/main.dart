import 'package:flutter/material.dart';

void main() {
  runApp(const SalaryApp());
}

class SalaryApp extends StatelessWidget {
  const SalaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Salary Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SalaryCalculator(),
    );
  }
}

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  final TextEditingController salaryController = TextEditingController();

  double basicSalary = 0;
  double hra = 0;
  double da = 0;
  double grossSalary = 0;
  double deductions = 0;
  double netSalary = 0;

  void calculateSalary() {
    double salary = double.tryParse(salaryController.text) ?? 0;

    setState(() {
      basicSalary = salary;

      // Allowance
      hra = basicSalary * 0.20; // 20% HRA
      da = basicSalary * 0.10;  // 10% DA

      // Gross Salary
      grossSalary = basicSalary + hra + da;

      // Deduction = 5% of gross salary
      deductions = grossSalary * 0.05;

      // Net Salary
      netSalary = grossSalary - deductions;
    });
  }

  void clearData() {
    setState(() {
      salaryController.clear();
      basicSalary = 0;
      hra = 0;
      da = 0;
      grossSalary = 0;
      deductions = 0;
      netSalary = 0;
    });
  }

  Widget salaryRow(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '₹ ${value.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Salary Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Basic Salary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Basic Salary',
                hintText: 'Enter salary',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateSalary,
              child: const Text(
                'Calculate Salary',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: clearData,
              child: const Text('Clear'),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text(
                      'Salary Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    salaryRow('Basic Salary', basicSalary),
                    salaryRow('HRA (20%)', hra),
                    salaryRow('DA (10%)', da),
                    salaryRow('Gross Salary', grossSalary),
                    salaryRow('Deductions (5%)', deductions),

                    const Divider(thickness: 1.5),

                    salaryRow('Net Salary', netSalary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

