import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Resume',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResumeScreen(),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Resume'), centerTitle: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile
              const Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 60),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Mit Chodvadiya',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'B.Tech Computer Science Student',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'mitchodvadiyagmail.com',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Education
              const Text(
                'Education',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text(
                    'B.Tech in Information and communication technology',
                  ),
                  subtitle: const Text('Marwadi University\nCGPA: 8.2'),
                ),
              ),

              const SizedBox(height: 15),

              // Experience
              const Text(
                'Experience',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.work),
                  title: const Text('Web Development Intern'),
                  subtitle: const Text(
                    'Evince Infosoft\nHTML, CSS, JavaScript, PHP, MySQL',
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Projects
              const Text(
                'Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text('Retaistocks AI'),
                      subtitle: Text(
                        'AI-powered e-commerce intelligence system.',
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.fastfood),
                      title: Text('FoodLens'),
                      subtitle: Text('Flutter application for food analysis.'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Skills
              const Text(
                'Skills',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children: const [
                      Chip(label: Text('Python')),
                      Chip(label: Text('C++')),
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('HTML')),
                      Chip(label: Text('CSS')),
                      Chip(label: Text('JavaScript')),
                      Chip(label: Text('MySQL')),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Achievements
              const Text(
                'Achievements',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.emoji_events),
                      title: Text('Participated in Hackathons'),
                    ),

                    ListTile(
                      leading: Icon(Icons.verified),
                      title: Text('Completed Technical Certifications'),
                    ),

                    ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Solved Coding Problems'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Contact
              const Text(
                'Contact',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('mitchodavadiya@gmail.com'),
                    ),

                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('+91 98765 43210'),
                    ),

                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Rajkot, Gujarat'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
