import 'package:flutter/material.dart';
import 'package:profix_new/User/CleanerProfiles/AnitaProfilePage.dart';
import 'package:profix_new/User/CleanerProfiles/RajuProfilePage.dart';
import 'package:profix_new/User/CleanerProfiles/SitaProfilePage.dart';

void main() => runApp(const GeneralCleaningPageApp());

class GeneralCleaningPageApp extends StatelessWidget {
  const GeneralCleaningPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeneralCleaningPage(),
    );
  }
}

class GeneralCleaningPage extends StatelessWidget {
  const GeneralCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Cleaning Services'),
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
                    image: AssetImage('assets/GeneralCleaning.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              // Text(
              //   'General Cleaning',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              const SizedBox(height: 20),
              const Text(
                'General cleaning involves a thorough cleaning of your home or office space to ensure a clean and hygienic environment.',
                style: TextStyle(fontSize: 17),
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
                icon: Icons.cleaning_services,
                service: 'Dusting',
                description:
                    'Removing dust from surfaces, shelves, and furniture',
              ),
              const IncludedServiceTile(
                icon: Icons.cleaning_services,
                service: 'Vacuuming',
                description: 'Vacuuming floors, carpets, and rugs',
              ),
              const IncludedServiceTile(
                icon: Icons.cleaning_services,
                service: 'Mopping',
                description: 'Mopping floors with disinfectant',
              ),
              const IncludedServiceTile(
                icon: Icons.cleaning_services,
                service: 'Bathroom Cleaning',
                description: 'Cleaning toilets, sinks, and shower areas',
              ),
              const IncludedServiceTile(
                icon: Icons.cleaning_services,
                service: 'Kitchen Cleaning',
                description: 'Cleaning countertops, appliances, and sinks',
              ),
              const IncludedServiceTile(
                icon: Icons.cleaning_services,
                service: 'Trash Removal',
                description: 'Emptying trash bins and replacing liners',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top General Cleaners',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              ProfessionalProfileTile(
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
                        ));
                  },
                  imagePath: 'assets/SitaRaiCleaner.PNG'),
              const SizedBox(height: 10),
              ProfessionalProfileTile(
                  name: 'Raju Shrestha',
                  experience: '3 years of experience',
                  rating: 4.6,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RajuProfilePage(
                                  name: 'Raju Shrestha',
                                  experience:
                                      '3 years of experience in cleaning services.',
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
                                      'reviewText':
                                          'Excellent service, very professional.',
                                    },
                                    {
                                      'reviewerName': 'Rajeev',
                                      'reviewText':
                                          'Raju did a great job, highly recommend him!',
                                    },
                                    {
                                      'reviewerName': 'Mina',
                                      'reviewText':
                                          'Very thorough and efficient.',
                                    },
                                  ],
                                  imagePath: 'assets/RajuShresthaCleaner.PNG',
                                  providerId: 'w4BcWJFfSEpZday56cgH',
                                )));
                  },
                  imagePath: 'assets/RajuShresthaCleaner.PNG'),
              const SizedBox(height: 10),
              ProfessionalProfileTile(
                  name: 'Anita Thapa',
                  experience: '7 years of experience',
                  rating: 4.9,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AnitaProfilePage(
                                  name: 'Anita Thapa',
                                  experience:
                                      '7 years of experience in cleaning services.',
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
                                      'reviewText':
                                          'Excellent service, very professional.',
                                    },
                                    {
                                      'reviewerName': 'Rajeev',
                                      'reviewText':
                                          'Anita did a great job, highly recommend her!',
                                    },
                                    {
                                      'reviewerName': 'Mina',
                                      'reviewText':
                                          'Very thorough and efficient.',
                                    },
                                  ],
                                  imagePath: 'assets/AnitaThapaCleaner.PNG',
                                  providerId: 'Anita Thapa ( Cleaner)',
                                )));
                  },
                  imagePath: 'assets/AnitaThapaCleaner.PNG'),
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
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
