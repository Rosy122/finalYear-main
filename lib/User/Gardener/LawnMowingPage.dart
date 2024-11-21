import 'package:flutter/material.dart';
import 'package:profix_new/User/GardenerProfiles/PabitraLawnMowing.dart';
import 'package:profix_new/User/GardenerProfiles/PratibhaLawnMowing.dart';
import 'package:profix_new/User/GardenerProfiles/RajuLawnMowing.dart';
// import 'package:profix/RajuLawnMowing.dart';
// import 'package:profix/SitaLawnMowing.dart';
// import 'package:profix/GopalLawnMowing.dart';

class LawnMowingPage extends StatelessWidget {
  const LawnMowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lawn Mowing Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/LawnMowing.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Lawn mowing services provide regular and professional lawn care to ensure your grass is well-maintained and healthy.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'What is included:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Regular Mowing',
                description:
                    'Cutting the grass to a specified height on a regular basis.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Edging',
                description:
                    'Creating clean and defined edges along walkways and driveways.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Weed Control',
                description: 'Applying treatments to prevent or remove weeds.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Grass Clipping Removal',
                description:
                    'Collecting and removing grass clippings after mowing.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lawn Maintenance Advice',
                description:
                    'Providing guidance on how to maintain a healthy lawn.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Lawn Mowing Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Raju Singh',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/RajuLawnMowing.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LawnMowingProfile(
                                name: 'Raju Singh',
                                experience:
                                    '8 years of experience in lawn mowing services.',
                                rating: 4.8,
                                bio:
                                    'Raju Singh is a dedicated lawn care professional with 8 years of experience. His attention to detail ensures your lawn looks its best all year round.',
                                services: [
                                  'Regular Lawn Mowing',
                                  'Edging and Trimming',
                                  'Lawn Fertilization',
                                  'Weed Control',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Suman Gautam',
                                    'reviewText':
                                        'Raju did a fantastic job with our lawn. It has never looked better!',
                                  },
                                  {
                                    'reviewerName': 'Priya Sharma',
                                    'reviewText':
                                        'Very satisfied with Raju’s work. He is punctual and professional.',
                                  },
                                  {
                                    'reviewerName': 'Anil Shrestha',
                                    'reviewText':
                                        'Raju is an expert in lawn care. I highly recommend his services.',
                                  },
                                ],
                                imagePath: 'assets/RajuLawnMowing.PNG',
                                providerId: 'Raju Singh(LawnMowing)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Pratibha Sharma',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/PratibhaLawnMowing.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PratibhaLawnMowing(
                                name: 'Pratibha Sharma',
                                experience:
                                    '5 years of experience in lawn mowing services.',
                                rating: 4.7,
                                bio:
                                    'Pratibha Sharma is a passionate lawn care expert with 5 years of experience. She ensures your lawn is perfectly maintained and healthy.',
                                services: [
                                  'Regular Lawn Mowing',
                                  'Edging and Trimming',
                                  'Lawn Fertilization',
                                  'Weed Control',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Ramesh Thapa',
                                    'reviewText':
                                        'Pratibha did a great job with our lawn. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Sunita Bhandari',
                                    'reviewText':
                                        'Very pleased with the service. Pratibha is reliable and efficient.',
                                  },
                                  {
                                    'reviewerName': 'Bikash Shrestha',
                                    'reviewText':
                                        'Pratibha’s attention to detail is amazing. The lawn looks beautiful!',
                                  },
                                ],
                                imagePath: 'assets/PratibhaLawnMowing.PNG',
                                providerId: 'Pratibha Sharma(LawnMowing)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Pabitra Lama',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/PabitraLawnMowing.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PabitraLawnMowing(
                                name: 'Pabitra Lama',
                                experience:
                                    '10 years of experience in lawn mowing services.',
                                rating: 4.9,
                                bio:
                                    'Pabitra Lama is an expert in lawn care with a decade of experience. She is known for her attention to detail and commitment to keeping lawns healthy and well-manicured.',
                                services: [
                                  'Lawn Mowing',
                                  'Trimming and Edging',
                                  'Lawn Aeration',
                                  'Fertilization and Weed Control',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Kamal Shrestha',
                                    'reviewText':
                                        'Pabitra did an exceptional job with my lawn. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Sita Rai',
                                    'reviewText':
                                        'Very happy with Pabitra’s service. She’s professional and thorough.',
                                  },
                                  {
                                    'reviewerName': 'Gopal Lama',
                                    'reviewText':
                                        'Pabitra is reliable and knows her work well. My lawn looks great!',
                                  },
                                ],
                                imagePath: 'assets/PabitraLawnMowing.PNG',
                                providerId: 'Pabitra Lama(LawnMowing)',
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

class IncludedServiceTile extends StatelessWidget {
  final IconData icon;
  final String service;
  final String description;

  const IncludedServiceTile({
    super.key,
    required this.icon,
    required this.service,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 122, 165, 160)),
      title: Text(
        service,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}

class ProfessionalProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final VoidCallback onTap;
  final String imagePath;

  const ProfessionalProfileTile({
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
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
