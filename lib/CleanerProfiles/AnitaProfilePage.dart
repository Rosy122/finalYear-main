import 'package:flutter/material.dart';

class AnitaProfilePage extends StatelessWidget {
  const AnitaProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anita Thapa\'s Profile'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage(
                        'assets/AnitaThapaCleaner.PNG'), // Uncomment if using an image
                    // child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Anita Thapa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 122, 165, 160),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700]),
                          const SizedBox(width: 5),
                          const Text(
                            '4.9',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // About Section
              const Text(
                'About Anita Thapa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Anita Thapa is a highly experienced cleaner with 7 years of experience. She is known for her meticulous cleaning and customer satisfaction.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Services Offered Section
              const Text(
                'Services Offered',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.check, color: Colors.green),
                title: Text('General Cleaning'),
              ),
              const ListTile(
                leading: Icon(Icons.check, color: Colors.green),
                title: Text('Deep Cleaning'),
              ),
              const ListTile(
                leading: Icon(Icons.check, color: Colors.green),
                title: Text('Window Cleaning'),
              ),
              const ListTile(
                leading: Icon(Icons.check, color: Colors.green),
                title: Text('Bathroom Cleaning'),
              ),
              const SizedBox(height: 20),
              // Reviews Section
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title:
                    Text('Anita is fantastic! Very detailed and professional.'),
              ),
              const ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Great service, my house has never been cleaner.'),
              ),
              const ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Anita did a wonderful job, highly recommended!'),
              ),
              const SizedBox(height: 20),
              // Book Service Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your booking functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 122, 165, 160),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Book Service',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
