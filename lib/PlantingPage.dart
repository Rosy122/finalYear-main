import 'package:flutter/material.dart';
import 'package:profix_new/RabinPlanting.dart';
import 'package:profix_new/SabiPlanting.dart';
import 'package:profix_new/SaboPlanting.dart';

class PlantingPage extends StatelessWidget {
  const PlantingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planting Services'),
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
                    image: AssetImage('assets/Planting.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Planting services include the selection, placement, and care of plants, ensuring your garden thrives with healthy, beautiful greenery.',
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
                service: 'Plant Selection',
                description:
                    'Helping you choose the best plants for your garden based on soil, climate, and aesthetics.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Soil Preparation',
                description:
                    'Preparing the soil to ensure optimal growth conditions for your plants.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Planting',
                description:
                    'Proper planting techniques to ensure plants thrive.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Mulching',
                description:
                    'Applying mulch to retain moisture and reduce weeds.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Watering and Fertilization',
                description:
                    'Ensuring plants receive the right amount of water and nutrients.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Planting Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Rabin Shahi',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/RabinPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RabinPlantingPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabo Shrestha',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/SaboPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaboPlantingPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabi Shah',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/SabiPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SabiPlantingPage()));
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
