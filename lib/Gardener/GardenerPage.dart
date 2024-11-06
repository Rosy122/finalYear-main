import 'package:flutter/material.dart';
import 'package:profix_new/Gardener/GardenDesignPage.dart';
import 'package:profix_new/Gardener/LawnMowingPage.dart';
import 'package:profix_new/GardenerProfiles/MeeraGardener.dart';
import 'package:profix_new/GardenerProfiles/NitinGardener.dart';
import 'package:profix_new/Gardener/PlantingPage.dart';
import 'package:profix_new/GardenerProfiles/RaviGardener.dart';

void main() => runApp(const GardenerPageApp());

class GardenerPageApp extends StatelessWidget {
  const GardenerPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GardenerPage(),
    );
  }
}

class GardenerPage extends StatelessWidget {
  const GardenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gardener Services'),
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
                icon: Icons.grass,
                service: 'Lawn Mowing',
                description: 'Regular lawn mowing and maintenance',
                price: 'Rs. 500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LawnMowingPage()));
                },
              ),
              ServiceTile(
                icon: Icons.local_florist,
                service: 'Planting',
                description: 'Planting flowers and shrubs',
                price: 'Rs. 600/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlantingPage()));
                },
              ),
              ServiceTile(
                icon: Icons.park,
                service: 'Garden Design',
                description: 'Design and layout for new gardens',
                price: 'Rs. 1200/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GardenDesignPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Gardeners',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              ProfessionalProfileTile(
                name: 'Ravi Kumar',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/RaviGardener.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RaviGardenerPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Meera Dhakal',
                experience: '5 years of experience',
                rating: 4.6,
                imagePath: 'assets/MeeraGardener.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MeeraGardenerPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Nitin Yadav',
                experience: '6 years of experience',
                rating: 4.7,
                imagePath: 'assets/NitinGardener.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NitinGardenerPage()));
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
