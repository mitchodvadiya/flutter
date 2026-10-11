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
      title: 'Department Information',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DepartmentScreen(),
    );
  }
}

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department Information'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Department Name
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.computer, size: 70, color: Colors.blue),

                    SizedBox(height: 10),

                    Text(
                      'Department of computer engineering',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Marwadi University',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Faculty Section
              const Text(
                'Faculty',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('jayntilal sarvaiya'),
                  subtitle: const Text('Head of Department'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: const Text('Prof. pradip patel'),
                  subtitle: const Text('Assistant Professor'),
                ),
              ),

              const SizedBox(height: 15),

              // Courses Section
              const Text(
                'Courses',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('B.Tech in Computer Science'),
                    ),

                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('B.Tech in Information Technology'),
                    ),

                    ListTile(
                      leading: Icon(Icons.school),
                      title: Text('M.Tech in Computer Science'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Facilities Section
              const Text(
                'Facilities',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.computer),
                      title: Text('Computer Labs'),
                    ),

                    ListTile(
                      leading: Icon(Icons.wifi),
                      title: Text('High Speed Wi-Fi'),
                    ),

                    ListTile(
                      leading: Icon(Icons.library_books),
                      title: Text('Digital Library'),
                    ),

                    ListTile(
                      leading: Icon(Icons.science),
                      title: Text('Research Laboratory'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Contact Information
              const Text(
                'Contact Information',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Card(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Address'),
                      subtitle: Text('Marwadi University, Rajkot, Gujarat'),
                    ),

                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Phone'),
                      subtitle: Text('+91 99098 94095'),
                    ),

                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Email'),
                      subtitle: Text('ce@marwadiuniversity.ac.in'),
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
