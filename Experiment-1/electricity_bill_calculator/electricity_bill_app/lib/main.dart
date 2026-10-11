import 'package:flutter/material.dart';

void main() {
  runApp(const ElectricityBillApp());
}

class ElectricityBillApp extends StatelessWidget {
  const ElectricityBillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Electricity Bill Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ElectricityBillCalculator(),
    );
  }
}

class ElectricityBillCalculator extends StatefulWidget {
  const ElectricityBillCalculator({super.key});

  @override
  State<ElectricityBillCalculator> createState() =>
      _ElectricityBillCalculatorState();
}

class _ElectricityBillCalculatorState extends State<ElectricityBillCalculator> {
  final TextEditingController unitController = TextEditingController();

  double units = 0;
  double billAmount = 0;

  void calculateBill() {
    double enteredUnits = double.tryParse(unitController.text) ?? 0;
    double bill = 0;

    if (enteredUnits <= 100) {
      bill = enteredUnits * 1.50;
    } else if (enteredUnits <= 200) {
      bill = (100 * 1.50) + ((enteredUnits - 100) * 2.50);
    } else if (enteredUnits <= 300) {
      bill = (100 * 1.50) + (100 * 2.50) + ((enteredUnits - 200) * 4.00);
    } else {
      bill =
          (100 * 1.50) +
          (100 * 2.50) +
          (100 * 4.00) +
          ((enteredUnits - 300) * 5.00);
    }

    setState(() {
      units = enteredUnits;
      billAmount = bill;
    });
  }

  void clearData() {
    setState(() {
      unitController.clear();
      units = 0;
      billAmount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electricity Bill Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Electricity Consumption',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: unitController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Units Consumed',
                hintText: 'Enter units',
                suffixText: 'Units',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateBill,
              child: const Text(
                'Calculate Bill',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 10),

            OutlinedButton(onPressed: clearData, child: const Text('Clear')),

            const SizedBox(height: 25),

            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const Text(
                      'Bill Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Units Consumed',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${units.toStringAsFixed(0)} Units',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const Divider(),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Bill',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹ ${billAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Electricity Slabs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text('0 - 100 Units    → ₹1.50 / Unit'),
                    const Text('101 - 200 Units  → ₹2.50 / Unit'),
                    const Text('201 - 300 Units  → ₹4.00 / Unit'),
                    const Text('Above 300 Units  → ₹5.00 / Unit'),
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
