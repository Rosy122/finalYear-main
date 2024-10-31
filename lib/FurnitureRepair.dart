import 'package:flutter/material.dart';
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Carpenter1Page(), // Make sure to create this page
                  //   ),
                  // );
                },
              ),
              ProfessionalProfileTile(
                name: 'Saroj Maharjan',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/Saroj.PNG',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Carpenter2Page(), // Make sure to create this page
                  //   ),
                  // );
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabina Maharjan',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/Sabina.PNG',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Carpenter3Page(), // Make sure to create this page
                  //   ),
                  // );
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
