import 'package:flutter/material.dart';
import 'package:profix_new/User/Photographer/EventPhotography.dart';
import 'package:profix_new/User/Photographer/Portrait.dart';
import 'package:profix_new/User/Photographer/WeddingPhotographer.dart';
import 'package:profix_new/User/PhotographerProfiles/AmitPhotography.dart';
import 'package:profix_new/User/PhotographerProfiles/RajivPhotography.dart';
import 'package:profix_new/User/PhotographerProfiles/SnehaPhotography.dart';

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
      body: SingleChildScrollView(
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WeddingPhotographyPage()));
                },
              ),
              ServiceTile(
                icon: Icons.photo_camera,
                service: 'Portrait Photography',
                description: 'Professional portraits for individuals or groups',
                price: 'Rs. 5000/session',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PortraitPhotographyPage()));
                },
              ),
              ServiceTile(
                icon: Icons.landscape,
                service: 'Event Photography',
                description: 'Photograph your events with high quality',
                price: 'Rs. 8000/event',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventPhotographyPage()));
                },
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
                imagePath: 'assets/Amit.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AmitPatelPhotographyService(
                                  name: 'Amit Patel',
                                  experience:
                                      '10 years of experience in photography services.',
                                  rating: 4.9,
                                  bio:
                                      'Amit Patel is a skilled photographer with over 10 years of experience, specializing in wedding, portrait, and event photography.',
                                  services: [
                                    'Wedding Photography (Rs. 15000/event)',
                                    'Portrait Photography (Rs. 5000/session)',
                                    'Event Photography (Rs. 8000/event)',
                                  ],
                                  reviews: [
                                    {
                                      'reviewerName': 'Sneha Rao',
                                      'reviewText':
                                          'Amit’s photography was amazing. Highly recommend!',
                                    },
                                    {
                                      'reviewerName': 'Rajiv Kumar',
                                      'reviewText':
                                          'Great quality photos. Very professional!',
                                    },
                                    {
                                      'reviewerName': 'Amit Patel',
                                      'reviewText':
                                          'Captured my wedding beautifully. Couldn’t be happier!',
                                    },
                                  ],
                                  imagePath: 'assets/Amit.PNG',
                                  providerId: 'Amit Patel(Photography)')));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sneha Rao',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/Sneha.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SnehaRaoPhotographyService(
                                name: 'Sneha Rao',
                                experience:
                                    '7 years of experience in photography services.',
                                rating: 4.8,
                                bio:
                                    'Sneha Rao is a talented photographer with 7 years of experience, specializing in wedding, portrait, and event photography.',
                                services: [
                                  'Wedding Photography (Rs. 15000/event)',
                                  'Portrait Photography (Rs. 5000/session)',
                                  'Event Photography (Rs. 8000/event)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Amit Patel',
                                    'reviewText':
                                        'Sneha’s photos are of the highest quality. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Rajiv Kumar',
                                    'reviewText':
                                        'Great experience with Sneha. She captured our event beautifully.',
                                  },
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'Absolutely loved the wedding photos. Thank you for your great work!',
                                  },
                                ],
                                imagePath: 'assets/Sneha.PNG',
                                providerId: 'Sneha Rao(Photography)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Rajiv Kumar',
                experience: '6 years of experience',
                rating: 4.7,
                imagePath: 'assets/Rajiv.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RajivKumarPhotographyService(
                                name: 'Rajiv Kumar',
                                experience:
                                    '6 years of experience in photography services.',
                                rating: 4.7,
                                bio:
                                    'Rajiv Kumar is a professional photographer with 6 years of experience in wedding, portrait, and event photography.',
                                services: [
                                  'Wedding Photography (Rs. 15000/event)',
                                  'Portrait Photography (Rs. 5000/session)',
                                  'Event Photography (Rs. 8000/event)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'Rajiv’s photos were amazing. Definitely recommend!',
                                  },
                                  {
                                    'reviewerName': 'Amit Patel',
                                    'reviewText':
                                        'Great quality work. He captured every moment perfectly!',
                                  },
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'Fantastic photographer! Made our event special.',
                                  },
                                ],
                                imagePath: 'assets/Rajiv.PNG',
                                providerId: 'Rajiv Kumar(Photography)',
                              )));
                },
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
  final VoidCallback onTap;

  const ServiceTile({
    super.key,
    required this.icon,
    required this.service,
    required this.description,
    required this.price,
    required this.onTap,
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
        onTap: onTap,
      ),
    );
  }
}

class ProfessionalProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const ProfessionalProfileTile({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
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
        onTap: onTap,
      ),
    );
  }
}
