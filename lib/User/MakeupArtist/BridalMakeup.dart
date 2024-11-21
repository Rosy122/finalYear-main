import 'package:flutter/material.dart';
import 'package:profix_new/User/MakeupArtistProfiles/AnitaMakeup.dart';
import 'package:profix_new/User/MakeupArtistProfiles/PriyaMakeup.dart';
import 'package:profix_new/User/MakeupArtistProfiles/RaviMakeup.dart';

class BridalMakeupPage extends StatelessWidget {
  const BridalMakeupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bridal Makeup Service'),
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
                    image: AssetImage(
                        'assets/Bride.PNG'), // Add your bridal makeup image path here
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Bridal makeup service provides expert makeup for your special day, ensuring a flawless and long-lasting look.',
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
                service: 'Full Bridal Makeup',
                description: 'Complete makeup for your wedding day.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Hairstyling',
                description:
                    'Elegant hairstyles tailored to your wedding look.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Pre-Wedding Consultation',
                description: 'Discussion and trial session before the event.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Touch-up Kit',
                description:
                    'A kit to maintain your makeup throughout the day.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Bridal Makeup Artists',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Priya Singh',
                experience: '8 years of experience',
                rating: 4.9,
                imagePath: 'assets/Priya.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PriyaSinghMakeupService(
                                name: 'Priya Singh',
                                experience:
                                    '8 years of experience in makeup artistry.',
                                rating: 4.9,
                                bio:
                                    'Priya Singh is a skilled makeup artist with 8 years of experience specializing in bridal, party, and special occasion makeup.',
                                services: [
                                  'Bridal Makeup (Rs. 8000/event)',
                                  'Party Makeup (Rs. 4000/session)',
                                  'Special Occasion Makeup (Rs. 5000/session)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Anita Sharma',
                                    'reviewText':
                                        'Priya’s bridal makeup was fantastic. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Ravi Mehta',
                                    'reviewText':
                                        'She did an amazing job for the party makeup.',
                                  },
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'Her makeup skills are exceptional. Loved the outcome!',
                                  },
                                ],
                                imagePath: 'assets/Priya.PNG',
                                providerId: 'Priya Singh(Makeup)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Anita Sharma',
                experience: '6 years of experience',
                rating: 4.8,
                imagePath: 'assets/Anita.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnitaSharmaMakeupService(
                                name: 'Anita Sharma',
                                experience:
                                    '6 years of experience in makeup artistry.',
                                rating: 4.8,
                                bio:
                                    'Anita Sharma is a professional makeup artist with 6 years of experience specializing in bridal, party, and special occasion makeup.',
                                services: [
                                  'Bridal Makeup (Rs. 8000/event)',
                                  'Party Makeup (Rs. 4000/session)',
                                  'Special Occasion Makeup (Rs. 5000/session)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Priya Singh',
                                    'reviewText':
                                        'Anita is amazing! She did fantastic work for my wedding.',
                                  },
                                  {
                                    'reviewerName': 'Ravi Mehta',
                                    'reviewText':
                                        'The makeup for the event was flawless. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'Loved her skills! Will definitely book her again.',
                                  },
                                ],
                                imagePath: 'assets/Anita.PNG',
                                providerId: 'Anita Sharma(Makeup)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Ravi Mehta',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/RaviM.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RaviMehtaMakeupService(
                                name: 'Ravi Mehta',
                                experience:
                                    '5 years of experience in makeup artistry.',
                                rating: 4.7,
                                bio:
                                    'Ravi Mehta is a talented makeup artist with 5 years of experience, offering bridal, party, and special occasion makeup services.',
                                services: [
                                  'Bridal Makeup (Rs. 8000/event)',
                                  'Party Makeup (Rs. 4000/session)',
                                  'Special Occasion Makeup (Rs. 5000/session)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Anita Sharma',
                                    'reviewText':
                                        'Ravi did an excellent job on my bridal makeup. Loved it!',
                                  },
                                  {
                                    'reviewerName': 'Sneha Rao',
                                    'reviewText':
                                        'He’s amazing at what he does. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Priya Singh',
                                    'reviewText':
                                        'His makeup skills are top-notch. Will hire again.',
                                  },
                                ],
                                imagePath: 'assets/RaviM.PNG',
                                providerId: 'Ravi Mehta(Makeup)',
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
