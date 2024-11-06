import 'package:flutter/material.dart';
import 'package:profix_new/GardenerProfiles/GojoGardenDesign.dart';
import 'package:profix_new/GardenerProfiles/RadhikaGardenDesign.dart';
import 'package:profix_new/GardenerProfiles/SharmilaGardenDesign.dart';

class GardenDesignPage extends StatelessWidget {
  const GardenDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garden Design Services'),
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
                    image: AssetImage('assets/GardenDesign.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Garden design services help you create a beautiful and functional outdoor space tailored to your preferences and the local environment.',
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
                service: 'Landscape Planning',
                description:
                    'Designing a layout that maximizes the beauty and utility of your garden space.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Plant Selection',
                description:
                    'Choosing plants that thrive in your local climate and fit your aesthetic preferences.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Hardscaping',
                description:
                    'Incorporating elements like paths, walls, and patios into the garden design.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Water Features',
                description:
                    'Designing and installing ponds, fountains, and other water features.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lighting Design',
                description:
                    'Creating a lighting plan that enhances the garden’s beauty and functionality at night.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Garden Design Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Radhika Gurung',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/RadhikaGardenDesign.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RadhikaGardenDesignPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sharmila Kumar',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/SharmilaGardenDesign.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SharmilaGardenDesignPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Gojo Lama',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/GojoGardenDesign.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GojoGardenDesignPage()));
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
