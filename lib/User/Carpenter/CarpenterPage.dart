import 'package:flutter/material.dart';
import 'package:profix_new/User/Carpenter/CabinetInstallation.dart';
import 'package:profix_new/User/Carpenter/CustomFurniture.dart';
import 'package:profix_new/User/Carpenter/FurnitureRepair.dart';
import 'package:profix_new/User/CarpenterProfiles/DeepakCarpenter.dart';
import 'package:profix_new/User/CarpenterProfiles/MinaCarpenter.dart';
import 'package:profix_new/User/CarpenterProfiles/RaviCarpenter.dart';

void main() => runApp(const CarpenterPageApp());

class CarpenterPageApp extends StatelessWidget {
  const CarpenterPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarpenterPage(),
    );
  }
}

class CarpenterPage extends StatelessWidget {
  const CarpenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carpenter Services'),
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
                icon: Icons.build,
                service: 'Furniture Repair',
                description: 'Repair and restoration of furniture',
                price: 'Rs. 1000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FurniturerepairPage()));
                },
              ),
              ServiceTile(
                icon: Icons.chair,
                service: 'Custom Furniture',
                description: 'Design and build custom furniture',
                price: 'Rs. 2000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomFurniturePage()));
                },
              ),
              ServiceTile(
                icon: Icons.home,
                service: 'Cabinet Installation',
                description: 'Install kitchen and bathroom cabinets',
                price: 'Rs. 1500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CabinetInstallationPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Carpenters',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              ProfessionalProfileTile(
                name: 'Deepak Kumar',
                experience: '12 years of experience',
                rating: 4.9,
                imagePath: 'assets/Deepak.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeepakCarpenterService(
                                name: 'Deepak Kumar',
                                experience:
                                    '12 years of experience in carpentry services.',
                                rating: 4.9,
                                bio:
                                    'Deepak Kumar is an experienced carpenter, known for his craftsmanship and exceptional skills in furniture design and home installations.',
                                services: [
                                  'Furniture Repair',
                                  'Custom Furniture',
                                  'Cabinet Installation',
                                  'Wooden Decks',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Rajesh Kumar',
                                    'reviewText':
                                        'Deepak is a true professional. His work was exceptional!',
                                  },
                                  {
                                    'reviewerName': 'Nisha Patel',
                                    'reviewText':
                                        'Very satisfied with the furniture repair. Great quality!',
                                  },
                                  {
                                    'reviewerName': 'Amit Sharma',
                                    'reviewText':
                                        'The cabinet installation was done quickly and perfectly.',
                                  },
                                ],
                                imagePath:
                                    'assets/Deepak.PNG', // Replace with actual image path
                                providerId: 'Deepak Kumar(Carpenter)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Mina Sharma',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/Mina.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MinaCarpenterService(
                                name: 'Mina Sharma',
                                experience:
                                    '8 years of experience in carpentry services.',
                                rating: 4.8,
                                bio:
                                    'Mina Sharma is a highly skilled carpenter specializing in custom furniture and home improvement services. Known for her precision and attention to detail.',
                                services: [
                                  'Furniture Repair',
                                  'Custom Furniture',
                                  'Cabinet Installation',
                                  'Wooden Decks',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Rajesh Kumar',
                                    'reviewText':
                                        'Mina did a fantastic job with the custom furniture. Highly recommend her!',
                                  },
                                  {
                                    'reviewerName': 'Sita Patel',
                                    'reviewText':
                                        'Very happy with the cabinet installation. Mina is a true professional.',
                                  },
                                  {
                                    'reviewerName': 'Anjali Rai',
                                    'reviewText':
                                        'Her work on the furniture repair was excellent. Will definitely hire her again.',
                                  },
                                ],
                                imagePath:
                                    'assets/Mina.PNG', // Replace with actual image path
                                providerId: 'Mina Sharma(Carpenter)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Ravi Patel',
                experience: '10 years of experience',
                rating: 4.7,
                imagePath: 'assets/Ravi.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RaviCarpenterService(
                                name: 'Ravi Patel',
                                experience:
                                    '10 years of experience in carpentry services.',
                                rating: 4.7,
                                bio:
                                    'Ravi Patel is an expert carpenter with over 10 years of experience in custom woodwork and home installations. Known for quality craftsmanship and customer satisfaction.',
                                services: [
                                  'Furniture Repair',
                                  'Custom Furniture',
                                  'Cabinet Installation',
                                  'Wooden Decks',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Anjali Patel',
                                    'reviewText':
                                        'Ravi did an amazing job repairing my old furniture.',
                                  },
                                  {
                                    'reviewerName': 'Rohan Shah',
                                    'reviewText':
                                        'Fantastic work on custom cabinetry. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Kiran Joshi',
                                    'reviewText':
                                        'Ravi’s attention to detail in the deck installation was superb.',
                                  },
                                ],
                                imagePath:
                                    'assets/Ravi.PNG', // Replace with actual image path
                                providerId: 'Ravi Patel(Carpenter)',
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
