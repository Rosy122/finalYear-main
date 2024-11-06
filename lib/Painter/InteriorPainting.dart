import 'package:flutter/material.dart';
import 'package:profix_new/PainterProfile/GopiInteriorPainting.dart';
import 'package:profix_new/PainterProfile/RamitaInteriorPainting.dart';
import 'package:profix_new/PainterProfile/ShivaniInteriorPainting.dart';

class InteriorPaintingPage extends StatelessWidget {
  const InteriorPaintingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interior Painting Services'),
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
                    image: AssetImage('assets/InteriorPainting.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Interior painting services ensure a fresh, vibrant look for your home or office, tailored to your taste and preferences.',
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
                service: 'Wall Preparation',
                description:
                    'Cleaning, patching, and sanding the walls to ensure a smooth surface for painting.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Ceiling Painting',
                description:
                    'Painting ceilings with precision to give a clean, finished look.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Trim and Baseboard Painting',
                description:
                    'Detail painting for trims, baseboards, and other woodwork for a polished appearance.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Color Consultation',
                description:
                    'Helping you choose the right colors to match your style and décor.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cleanup',
                description:
                    'Ensuring your space is clean and paint-free after the job is completed.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Interior Painting Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Ramita Thapa',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/RamitaInteriorPainting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RamitaInteriorPaintingPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Shivani Sharma',
                experience: '6 years of experience',
                rating: 4.7,
                imagePath: 'assets/ShivaniInteriorPainting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ShivaniInteriorPaintingPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Gopi Lama',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/GopiInteriorPainting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const GopiInteriorPaintingPage()));
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