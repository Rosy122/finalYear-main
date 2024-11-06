import 'package:flutter/material.dart';

void main() => runApp(const PhotographerPageApp());

class PhotographerPageApp extends StatelessWidget {
  const PhotographerPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotographerPage(),
    );
  }
}

class PhotographerPage extends StatelessWidget {
  const PhotographerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photography Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Available Services',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              SizedBox(height: 10),
              ServiceTile(
                icon: Icons.camera_alt,
                service: 'Wedding Photography',
                description: 'Capture every moment of your special day',
                price: 'Rs. 15000/event',
              ),
              ServiceTile(
                icon: Icons.photo_camera,
                service: 'Portrait Photography',
                description: 'Professional portraits for individuals or groups',
                price: 'Rs. 5000/session',
              ),
              ServiceTile(
                icon: Icons.landscape,
                service: 'Event Photography',
                description: 'Photograph your events with high quality',
                price: 'Rs. 8000/event',
              ),
              SizedBox(height: 20),
              Text(
                'Top Photographers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              ProfessionalProfileTile(
                name: 'Amit Patel',
                experience: '10 years of experience',
                rating: 4.9,
              ),
              ProfessionalProfileTile(
                name: 'Sneha Rao',
                experience: '7 years of experience',
                rating: 4.8,
              ),
              ProfessionalProfileTile(
                name: 'Rajiv Kumar',
                experience: '6 years of experience',
                rating: 4.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final IconData icon;
  final String service;
  final String description;
  final String price;

  const ServiceTile({super.key, 
    required this.icon,
    required this.service,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: const Color.fromARGB(255, 122, 165, 160),
        ),
        title: Text(
          service,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(price),
      ),
    );
  }
}

class ProfessionalProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  //final String imagePath;

  const ProfessionalProfileTile({super.key, 
    required this.name,
    required this.experience,
    required this.rating,
    //required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
            //backgroundImage: AssetImage(imagePath),
            ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(experience),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow[700]),
            Text(
              rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
