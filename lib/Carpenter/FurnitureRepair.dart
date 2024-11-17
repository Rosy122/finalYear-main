import 'package:flutter/material.dart';
import 'package:profix_new/CarpenterProfiles/JulinFurniture.dart';
import 'package:profix_new/CarpenterProfiles/SabinaFurnniture.dart';
import 'package:profix_new/CarpenterProfiles/SarojFurniture.dart';
// import 'package:profix_new/FurnitureRepairService.dart'; // Make sure to create this file for the individual service page
// import 'package:profix_new/Carpenter1.dart'; // Replace with actual names of your carpenter pages
// import 'package:profix_new/Carpenter2.dart';
// import 'package:profix_new/Carpenter3.dart';

class FurniturerepairPage extends StatelessWidget {
  const FurniturerepairPage({super.key});

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
                        'assets/FurnitureRepair.PNG'), // Update the image path accordingly
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Carpenter services offer professional assistance in repairing and customizing furniture to meet your needs.',
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
                service: 'Furniture Repair',
                description:
                    'Repairing damaged furniture such as chairs, tables, and cabinets.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Custom Furniture Design',
                description:
                    'Designing and building custom furniture according to client specifications.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Refinishing',
                description:
                    'Refinishing old furniture to restore its original beauty.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Assembly',
                description: 'Assembling ready-to-assemble furniture pieces.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Carpenter Professionals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Julin Maharjan',
                experience: '8 years of experience',
                rating: 4.9,
                imagePath: 'assets/Julin.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JulinFurnitureRepairService(
                        name: 'Julin Maharjan',
                        experience:
                            '8 years of experience in furniture repair services.',
                        rating: 4.9,
                        bio:
                            'Julin Sharma is a highly skilled furniture repair expert with over 6 years of experience. Known for her attention to detail and customer satisfaction.',
                        services: [
                          'Furniture Repair',
                          'Restoration of Antique Furniture',
                          'Custom Furniture Design',
                          'Wooden Restoration',
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Priya Rai',
                            'reviewText':
                                'Julin repaired my old wooden chair, and it looks brand new now. Amazing work!',
                          },
                          {
                            'reviewerName': 'Sita Verma',
                            'reviewText':
                                'Great experience with Julin! She did an excellent job restoring my wooden furniture.',
                          },
                          {
                            'reviewerName': 'Anita Shrestha',
                            'reviewText':
                                'Highly recommend Julin! She is meticulous and reliable.',
                          },
                        ],
                        imagePath: 'assets/Julin.PNG',
                        providerId: 'Julin Maharjan(Furniture)',
                      ),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Saroj Maharjan',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/Saroj.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SarojFurnitureService(
                        name: 'Saroj Maharjan',
                        experience:
                            '5 years of experience in Furniture Repair.',
                        rating: 4.7,
                        bio:
                            'Saroj Maharjan is a skilled furniture repair professional with extensive experience in repairing and restoring furniture to its original form.',
                        services: [
                          'Furniture Repair',
                          'Custom Furniture Design',
                          'Refinishing',
                          'Assembly',
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Sita Rai',
                            'reviewText':
                                'Saroj repaired my old chair beautifully. Highly recommend!',
                          },
                          {
                            'reviewerName': 'Ravi Thapa',
                            'reviewText':
                                'Excellent work! Saroj is quick and efficient.',
                          },
                          {
                            'reviewerName': 'Anita Sharma',
                            'reviewText':
                                'Very happy with the furniture repair service. Great job!',
                          },
                        ],
                        imagePath: 'assets/Saroj.PNG',
                        providerId: 'Saroj Maharjan(Furniture)',
                      ), // Make sure to create this page
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabina Maharjan',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/Sabina.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SabinaFurnitureRepair(
                        name: 'Sabina Maharjan',
                        experience:
                            '10 years of experience in furniture repair services.',
                        rating: 4.8,
                        bio:
                            'Sabina Maharjan is a skilled carpenter with 10 years of experience in furniture repair and custom design.',
                        services: [
                          'Furniture Repair',
                          'Custom Furniture Design',
                          'Refinishing',
                          'Assembly',
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Ravi Bhandari',
                            'reviewText':
                                'Sabina repaired my old table, and it looks like new!',
                          },
                          {
                            'reviewerName': 'Anita Rai',
                            'reviewText':
                                'Great service! Very happy with the work done on my wooden chairs.',
                          },
                          {
                            'reviewerName': 'Suman Gurung',
                            'reviewText':
                                'Sabina did a fantastic job in designing custom furniture for my home.',
                          },
                        ],
                        imagePath: 'assets/Sabina.PNG',
                        providerId: 'Sabina Maharjan( Furniture)',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Include the IncludedServiceTile and ProfessionalProfileTile classes here

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
