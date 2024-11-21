import 'package:flutter/material.dart';
import 'package:profix_new/User/ElectricianProfiles/DavidWiringInstallation.dart';
import 'package:profix_new/User/ElectricianProfiles/JaneWiringInstallation.dart';
import 'package:profix_new/User/ElectricianProfiles/JohnWiringInstallation.dart';

class WiringInstallationPage extends StatelessWidget {
  const WiringInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wiring Installation Services'),
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
                    image: AssetImage('assets/WiringInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Wiring installation services ensure that your electrical systems are safely and efficiently installed in compliance with all regulations.',
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
                service: 'New Wiring Installation',
                description:
                    'Setting up new electrical wiring in residential or commercial buildings.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Rewiring',
                description:
                    'Replacing old or faulty wiring to ensure safety and efficiency.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Electrical Panel Installation',
                description:
                    'Installing and upgrading electrical panels to handle more power.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lighting Installation',
                description: 'Installing indoor and outdoor lighting fixtures.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Outlet and Switch Installation',
                description:
                    'Installing new outlets and switches where needed.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Wiring Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'John Rai',
                experience: '15 years of experience',
                rating: 4.9,
                imagePath: 'assets/JohnWiring.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JohnWiringInstallation(
                                name: 'John Rai',
                                experience:
                                    '15 years of experience in wiring installation services.',
                                rating: 4.9,
                                bio:
                                    'John Rai has 15 years of experience in wiring installation services. His deep understanding of electrical systems and commitment to safety make him a trusted professional in the field.',
                                services: [
                                  'Residential Wiring Installation',
                                  'Commercial Wiring Installation',
                                  'Electrical Panel Upgrades',
                                  'Lighting Installation and Repair',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Michael Sharma',
                                    'reviewText':
                                        'John was incredibly thorough and ensured everything was installed safely. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Anjali Gupta',
                                    'reviewText':
                                        'Very professional and knowledgeable. John did a fantastic job with our home wiring.',
                                  },
                                  {
                                    'reviewerName': 'Ravi Shrestha',
                                    'reviewText':
                                        'John’s work exceeded our expectations. He’s very skilled and efficient.',
                                  },
                                ],
                                imagePath: 'assets/JohnWiring.PNG',
                                providerId: 'John Rai(Wiring Installation)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Jane Shrestha',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/JaneWiring.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JaneWiringInstallation(
                                name: 'Jane Shrestha',
                                experience:
                                    '10 years of experience in wiring installation services.',
                                rating: 4.8,
                                bio:
                                    'Jane Shrestha has 10 years of experience in wiring installation. She is known for her precision and thorough understanding of electrical systems, making her a highly sought-after professional.',
                                services: [
                                  'Residential Wiring Installation',
                                  'Commercial Wiring Installation',
                                  'Electrical Panel Upgrades',
                                  'Lighting Installation and Repair',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sunil Bajracharya',
                                    'reviewText':
                                        'Jane was very professional and handled our wiring installation with great care.',
                                  },
                                  {
                                    'reviewerName': 'Nisha Singh',
                                    'reviewText':
                                        'Excellent work by Jane. She is highly knowledgeable and very efficient.',
                                  },
                                  {
                                    'reviewerName': 'Amit Tamang',
                                    'reviewText':
                                        'Jane is the best in the business. Her work is top-notch and reliable.',
                                  },
                                ],
                                imagePath: 'assets/JaneWiring.PNG',
                                providerId:
                                    'Jane Shrestha( Wiring Installation)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'David Magar',
                experience: '8 years of experience',
                rating: 4.7,
                imagePath: 'assets/DavidWiring.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DavidWiringInstallation(
                                name: 'David Magar',
                                experience:
                                    '8 years of experience in wiring installation services.',
                                rating: 4.7,
                                bio:
                                    'David Magar has 8 years of experience in wiring installation. He is highly regarded for his attention to detail and efficiency in handling all types of wiring projects.',
                                services: [
                                  'Residential Wiring Installation',
                                  'Commercial Wiring Installation',
                                  'Electrical Panel Upgrades',
                                  'Lighting Installation and Repair',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Kiran Thapa',
                                    'reviewText':
                                        'David did a fantastic job with our home wiring. He was very professional and completed the work on time.',
                                  },
                                  {
                                    'reviewerName': 'Laxmi Gurung',
                                    'reviewText':
                                        'I am very satisfied with David’s work. He is knowledgeable and thorough in his approach.',
                                  },
                                  {
                                    'reviewerName': 'Sujan Rai',
                                    'reviewText':
                                        'David is reliable and efficient. He handled our office wiring installation perfectly.',
                                  },
                                ],
                                imagePath: 'assets/DavidWiring.PNG',
                                providerId: 'David Magar(wiring Installation)',
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
