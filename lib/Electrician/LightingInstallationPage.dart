import 'package:flutter/material.dart';
import 'package:profix_new/ElectricianProfiles/AshaLightingInstallation.dart';
import 'package:profix_new/ElectricianProfiles/BikashLightingInstallation.dart';
import 'package:profix_new/ElectricianProfiles/HariLightingInstallation.dart';

class LightingInstallationPage extends StatelessWidget {
  const LightingInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lighting Installation Services'),
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
                    image: AssetImage('assets/LightingInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Lighting installation services ensure that your lighting fixtures are installed safely and efficiently, enhancing the ambiance and functionality of your space.',
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
                service: 'Ceiling Light Installation',
                description:
                    'Installing ceiling lights in various areas like living rooms, kitchens, and bedrooms.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Wall Light Installation',
                description:
                    'Installing wall-mounted lights for ambient or task lighting.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Outdoor Light Installation',
                description:
                    'Setting up outdoor lighting for pathways, gardens, and security purposes.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Chandelier Installation',
                description:
                    'Expert installation of chandeliers, ensuring they are secure and level.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'LED Strip Installation',
                description:
                    'Installing LED strip lights for accent or under-cabinet lighting.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Lighting Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Hari Shrestha',
                experience: '8 years of experience',
                rating: 4.9,
                imagePath: 'assets/HariLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HariLightingInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Asha Khadka',
                experience: '6 years of experience',
                rating: 4.8,
                imagePath: 'assets/AshaLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AshaLightingInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Bikash Lama',
                experience: '10 years of experience',
                rating: 4.7,
                imagePath: 'assets/BikashLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BikashLightingInstallationPage()));
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
