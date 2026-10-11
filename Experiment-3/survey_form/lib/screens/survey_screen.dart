import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {

  final nameController = TextEditingController();

  String? selectedCourse;

  bool python = false;
  bool flutter = false;
  bool java = false;

  double rating = 3;

  void submitSurvey() {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Survey Submitted Successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Survey'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Text Input
            const Text(
              '1. Enter Your Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // Radio Button
            const Text(
              '2. Select Your Course',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              title: const Text('B.Tech'),
              value: 'B.Tech',
              groupValue: selectedCourse,

              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('BCA'),
              value: 'BCA',
              groupValue: selectedCourse,

              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('MCA'),
              value: 'MCA',
              groupValue: selectedCourse,

              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            const SizedBox(height: 15),

            // Checkboxes
            const Text(
              '3. Select Your Skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            CheckboxListTile(
              title: const Text('Python'),
              value: python,

              onChanged: (value) {
                setState(() {
                  python = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Flutter'),
              value: flutter,

              onChanged: (value) {
                setState(() {
                  flutter = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Java'),
              value: java,

              onChanged: (value) {
                setState(() {
                  java = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            // Slider
            const Text(
              '4. Rate Your Learning Experience',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Slider(
              value: rating,
              min: 1,
              max: 5,
              divisions: 4,

              label: rating.toString(),

              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            Center(
              child: Text(
                'Rating: ${rating.toInt()} / 5',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: submitSurvey,

                child: const Text(
                  'SUBMIT SURVEY',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}