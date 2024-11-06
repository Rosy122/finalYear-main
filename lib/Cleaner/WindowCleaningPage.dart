import 'package:flutter/material.dart';
import 'package:profix_new/CleanerProfiles/AnilWindowCleaning.dart';
import 'package:profix_new/CleanerProfiles/PriyaWindowCleaning.dart';
import 'package:profix_new/CleanerProfiles/RohitWindowCleaning.dart';

class WindowCleaningPage extends StatelessWidget {
  const WindowCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Window Cleaning Services'),
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
                    image: AssetImage('assets/WindowCleaning.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              // Text(
              //   'Window Cleaning',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              const SizedBox(height: 10),
              const Text(
                'Professional window cleaning services that ensure your windows are spotless and streak-free, enhancing the appearance of your home or office.',
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
                service: 'Interior Window Cleaning',
                description:
                    'Cleaning of all interior window surfaces, frames, and sills.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Exterior Window Cleaning',
                description:
                    'Thorough cleaning of all exterior window surfaces.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Screen Cleaning',
                description: 'Removing and cleaning of all window screens.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Track and Sill Cleaning',
                description:
                    'Cleaning of window tracks and sills to remove dirt and debris.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Mirror and Glass Door Cleaning',
                description:
                    'Polishing of mirrors and glass doors for a crystal-clear finish.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Window Cleaners',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Anil Kumar',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/AnilWindowCleaner.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnilKumarProfile(
                        name: 'Anil Kumar',
                        experience:
                            '7 years of experience in professional window cleaning.',
                        rating: 4.8,
                        bio:
                            'With 7 years of experience in window cleaning, I provide meticulous and reliable cleaning services. My attention to detail ensures your windows are spotless and streak-free.',
                        services: [
                          'Residential Window Cleaning',
                          'Commercial Window Cleaning',
                          'High-rise Window Cleaning',
                          'Post-Construction Window Cleaning'
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Ravi Patel',
                            'reviewText':
                                'Anil did a fantastic job cleaning my windows. Highly recommended!',
                          },
                          {
                            'reviewerName': 'Meera Sharma',
                            'reviewText':
                                'Professional and efficient service. The windows look great!',
                          },
                          {
                            'reviewerName': 'Sanjay Reddy',
                            'reviewText':
                                'Very thorough and reliable. Will use again for sure.',
                          },
                        ],
                        imagePath: 'assets/AnilWindowCleaner.PNG',
                      ),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Priya Shrestha',
                experience: '5 years of experience',
                rating: 4.9,
                imagePath: 'assets/PriyaWindowCleaner.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PriyaWindowCleaning(
                        name: 'Priya Shrestha',
                        experience:
                            '5 years of experience in professional window cleaning.',
                        rating: 4.9,
                        bio:
                            'With 5 years of experience in window cleaning, I offer high-quality and reliable services. My focus is on delivering a sparkling clean finish for every job.',
                        services: [
                          'Residential Window Cleaning',
                          'Commercial Window Cleaning',
                          'High-rise Window Cleaning',
                          'Post-Construction Window Cleaning'
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Anit Gurung',
                            'reviewText':
                                'Priya did an excellent job with my windows. Very satisfied!',
                          },
                          {
                            'reviewerName': 'Nina Rai',
                            'reviewText':
                                'Professional service and the windows are spotless!',
                          },
                          {
                            'reviewerName': 'Rajeev Sharma',
                            'reviewText':
                                'Great attention to detail. Highly recommended for window cleaning.',
                          },
                        ],
                        imagePath: 'assets/PriyaWindowCleaner.PNG',
                      ),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Rohit Shakya',
                experience: '6 years of experience',
                rating: 4.7,
                imagePath: 'assets/RohitWindowCleaner.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RohitWindowCleaning(
                                name: 'Rohit shakya',
                                experience:
                                    '6 years of experience in professional window cleaning.',
                                rating: 4.7,
                                bio:
                                    'With 6 years of experience in window cleaning, I offer reliable and detailed services for all types of properties. My commitment to quality ensures a spotless and streak-free finish every time.',
                                services: [
                                  'Residential Window Cleaning',
                                  'Commercial Window Cleaning',
                                  'High-rise Window Cleaning',
                                  'Post-Construction Window Cleaning'
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sunil Yadav',
                                    'reviewText':
                                        'Rohit provided excellent service and was very professional. My windows have never looked better!',
                                  },
                                  {
                                    'reviewerName': 'Pooja Maharjan',
                                    'reviewText':
                                        'Great work! Rohit was punctual and thorough in cleaning my office windows.',
                                  },
                                  {
                                    'reviewerName': 'Amit Timalsina',
                                    'reviewText':
                                        'Rohit did an amazing job with our post-construction window cleaning. Highly recommend!',
                                  },
                                ],
                                imagePath: 'assets/RohitWindowCleaner.PNG',
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
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
