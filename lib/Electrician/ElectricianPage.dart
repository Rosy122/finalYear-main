import 'package:flutter/material.dart';
import 'package:profix_new/Electrician/ElectricalRepairPage.dart';
import 'package:profix_new/Electrician/LightingInstallationPage.dart';
import 'package:profix_new/Electrician/WiringInstallationPage.dart';
import 'package:profix_new/ElectricianProfiles/AnitaElectrician.dart';
import 'package:profix_new/ElectricianProfiles/RajivElectrician.dart';
import 'package:profix_new/ElectricianProfiles/SunilElectrician.dart';

void main() => runApp(const ElectricianPageApp());

class ElectricianPageApp extends StatelessWidget {
  const ElectricianPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ElectricianPage(),
    );
  }
}

class ElectricianPage extends StatelessWidget {
  const ElectricianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrician Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Available Services',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              ServiceTile(
                icon: Icons.electrical_services,
                service: 'Wiring Installation',
                description: 'Install or upgrade electrical wiring',
                price: 'Rs. 1000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WiringInstallationPage()));
                },
              ),
              ServiceTile(
                icon: Icons.lightbulb,
                service: 'Lighting Installation',
                description: 'Install new lighting fixtures',
                price: 'Rs. 800/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LightingInstallationPage()));
                },
              ),
              ServiceTile(
                icon: Icons.bolt,
                service: 'Electrical Repair',
                description: 'Fix electrical faults and issues',
                price: 'Rs. 1200/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ElectricalRepairPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Electricians',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              ProfessionalProfileTile(
                name: 'Rajiv Kumar',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/RajivElectrician.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RajivElectrician(
                                name: 'Rajiv Kumar',
                                experience:
                                    '10 years of experience in electrical services.',
                                rating: 4.9,
                                bio:
                                    'Rajiv Kumar is a highly skilled electrician with a decade of experience. His commitment to safety and quality makes him a top choice for any electrical work.',
                                services: [
                                  'Home Electrical Wiring',
                                  'Circuit Breaker Installation',
                                  'Lighting Installation and Repair',
                                  'Electrical Maintenance',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Prakash Thapa',
                                    'reviewText':
                                        'Rajiv did an excellent job with our home wiring. Highly professional!',
                                  },
                                  {
                                    'reviewerName': 'Mina Shrestha',
                                    'reviewText':
                                        'Very satisfied with Rajiv’s work. He is reliable and skilled.',
                                  },
                                  {
                                    'reviewerName': 'Kiran Bhandari',
                                    'reviewText':
                                        'Rajiv is very experienced and trustworthy. I would definitely recommend him for any electrical work.',
                                  },
                                ],
                                imagePath:
                                    'assets/RajivElectrician.PNG', // Specify the correct path to the image asset
                                providerId: 'Rajiv Kumar(Electrician)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Anita Mahat',
                experience: '6 years of experience',
                rating: 4.7,
                imagePath: 'assets/AnitaElectrician.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnitaElectrician(
                                name: 'Anita Mahat',
                                experience:
                                    '6 years of experience in electrical services.',
                                rating: 4.7,
                                bio:
                                    'Anita Mahat brings 6 years of experience in electrical services. Known for her reliability and technical expertise, Anita is a great choice for your electrical needs.',
                                services: [
                                  'Home Electrical Wiring',
                                  'Outlet and Switch Installation',
                                  'Circuit Repairs',
                                  'Electrical Maintenance',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Suman Rai',
                                    'reviewText':
                                        'Anita was very professional and quick to fix our electrical issues. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Kavita Joshi',
                                    'reviewText':
                                        'Very pleased with Anita’s work. She was efficient and knowledgeable.',
                                  },
                                  {
                                    'reviewerName': 'Arjun Sharma',
                                    'reviewText':
                                        'Anita is a skilled electrician. She handled our electrical repairs with great expertise.',
                                  },
                                ],
                                imagePath: 'assets/AnitaElectrician.PNG',
                                providerId: 'Anita Mahat(Electrician)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sunil Sharma',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/SunilElectrician.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SunilElectrician(
                                name: 'Sunil Sharma',
                                experience:
                                    '8 years of experience in electrical services.',
                                rating: 4.8,
                                bio:
                                    'Sunil Sharma has 8 years of experience in the electrical field. Known for his exceptional skills and reliability, Sunil is a trusted professional for all your electrical needs.',
                                services: [
                                  'Home Electrical Wiring',
                                  'Outlet and Switch Installation',
                                  'Circuit Repairs',
                                  'Electrical Maintenance',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Deepak Thapa',
                                    'reviewText':
                                        'Sunil was very efficient and professional. He resolved our electrical issues quickly and effectively.',
                                  },
                                  {
                                    'reviewerName': 'Rita Joshi',
                                    'reviewText':
                                        'I am very satisfied with Sunil’s service. His work was thorough, and he was very knowledgeable.',
                                  },
                                  {
                                    'reviewerName': 'Keshav Kumar',
                                    'reviewText':
                                        'Sunil did an excellent job with our electrical repairs. Highly recommended for his skill and expertise.',
                                  },
                                ],
                                imagePath:
                                    'assets/SunilElectrician.PNG', // Specify the correct path to the image asset
                                providerId: 'Sunil Sharma(Electrician)',
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
            Text(rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
