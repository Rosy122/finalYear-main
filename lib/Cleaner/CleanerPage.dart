import 'package:flutter/material.dart';
import 'package:profix_new/Cleaner/BathroomCleaningPage.dart';
import 'package:profix_new/Cleaner/DeepCleaningPage.dart';
import 'package:profix_new/Cleaner/GeneralCleaningPage.dart';
import 'package:profix_new/Cleaner/PostConstructionCleaningPage.dart';
import 'package:profix_new/Cleaner/WindowCleaningPage.dart';
import 'package:profix_new/CleanerProfiles/AnitaProfilePage.dart';
import 'package:profix_new/CleanerProfiles/RajuProfilePage.dart';
import 'package:profix_new/CleanerProfiles/SitaProfilePage.dart';

void main() => runApp(const CleanerPageApp());

class CleanerPageApp extends StatelessWidget {
  const CleanerPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CleanerPage(),
    );
  }
}

class CleanerPage extends StatelessWidget {
  const CleanerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaner Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Available Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            ServiceTile(
              icon: Icons.cleaning_services,
              service: 'General Cleaning',
              description: 'Basic house cleaning tasks',
              price: 'Rs. 500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GeneralCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.grass,
              service: 'Deep Cleaning',
              description: 'Thorough cleaning including scrubbing and more',
              price: 'Rs. 1000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeepCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.window,
              service: 'Window Cleaning',
              description: 'Professional window cleaning',
              price: 'Rs. 300/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WindowCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.bathroom,
              service: 'Bathroom Cleaning',
              description: 'Professional bathroom cleaning',
              price: 'Rs. 300/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BathroomCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.construction,
              service: 'Post-Construction Cleaning',
              description: 'Professional post-construction cleaning',
              price: 'Rs. 400/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostConstructionCleaningPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Cleaners',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            CleanerProfileTile(
              name: 'Sita Rai',
              experience: '5 years of experience',
              rating: 4.8,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sitaprofilepage(
                      name: 'Sita Rai',
                      experience: '5 years of experience',
                      rating: 4.8,
                      bio:
                          'Sita Rai is an expert cleaner with over 5 years of experience, known for her attention to detail and customer satisfaction.',
                      services: [
                        'General Cleaning',
                        'Deep Cleaning',
                        'Window Cleaning',
                        'Bathroom Cleaning',
                      ],
                      reviews: [
                        {
                          'reviewerName': 'Kiran Lama',
                          'reviewText':
                              'Sita was very thorough and professional.',
                        },
                        {
                          'reviewerName': 'Sneha Thapa',
                          'reviewText':
                              'Sita cleaned our house so well. Highly recommended!',
                        },
                        {
                          'reviewerName': 'Manoj Shrestha',
                          'reviewText':
                              'Fantastic service, our house is sparkling clean!',
                        },
                      ],
                      imagePath: 'assets/SitaRaiCleaner.PNG',
                      providerId: 'UKD7e4u9r1G0pV3N1Tur',
                    ),
                  ),
                );
              },
              imagePath: 'assets/SitaRaiCleaner.PNG',
            ),
            CleanerProfileTile(
              name: 'Raju Shrestha',
              experience: '3 years of experience',
              rating: 4.6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RajuProfilePage(
                      name: 'Raju Shrestha',
                      experience: '3 years of experience in cleaning services.',
                      rating: 4.6,
                      bio:
                          'Raju Shrestha is a skilled cleaner with over 3 years of experience, known for his thoroughness and attention to detail.',
                      services: [
                        'General Cleaning',
                        'Deep Cleaning',
                        'Window Cleaning',
                        'Bathroom Cleaning'
                      ],
                      reviews: [
                        {
                          'reviewerName': 'Suresh',
                          'reviewText': 'Excellent service, very professional.',
                        },
                        {
                          'reviewerName': 'Rajeev',
                          'reviewText':
                              'Raju did a great job, highly recommend him!',
                        },
                        {
                          'reviewerName': 'Mina',
                          'reviewText': 'Very thorough and efficient.',
                        },
                      ],
                      imagePath: 'assets/RajuShresthaCleaner.PNG',
                      providerId: 'w4BcWJFfSEpZday56cgH',
                    ),
                  ),
                );
              },
              imagePath: 'assets/RajuShresthaCleaner.PNG',
            ),
            CleanerProfileTile(
              name: 'Anita Thapa',
              experience: '7 years of experience',
              rating: 4.9,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnitaProfilePage(
                      name: 'Anita Thapa',
                      experience: '7 years of experience in cleaning services.',
                      rating: 4.9,
                      bio:
                          'Anita Thapa is a highly experienced cleaner with 7 years of experience. She is known for her meticulous cleaning and customer satisfaction.',
                      services: [
                        'General Cleaning',
                        'Deep Cleaning',
                        'Window Cleaning',
                        'Bathroom Cleaning'
                      ],
                      reviews: [
                        {
                          'reviewerName': 'Suresh',
                          'reviewText': 'Excellent service, very professional.',
                        },
                        {
                          'reviewerName': 'Rajeev',
                          'reviewText':
                              'Anita did a great job, highly recommend her!',
                        },
                        {
                          'reviewerName': 'Mina',
                          'reviewText': 'Very thorough and efficient.',
                        },
                      ],
                      imagePath: 'assets/AnitaThapaCleaner.PNG',
                      providerId: 'Anita Thapa ( Cleaner)',
                    ),
                  ),
                );
              },
              imagePath: 'assets/AnitaThapaCleaner.PNG',
            ),
          ],
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon,
            size: 40, color: const Color.fromARGB(255, 122, 165, 160)),
        title:
            Text(service, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(price),
        onTap: onTap,
      ),
    );
  }
}

class CleanerProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const CleanerProfileTile({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
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
