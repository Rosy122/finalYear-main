import 'package:flutter/material.dart';
import 'package:profix_new/PainterProfile/BishalWallpaperInstallation.dart';
import 'package:profix_new/PainterProfile/GitaWallpaperInstallation.dart';
import 'package:profix_new/PainterProfile/KaiWallpaperInstallation.dart';

class WallpaperInstallationPage extends StatelessWidget {
  const WallpaperInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper Installation Services'),
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
                    image: AssetImage('assets/WallpaperInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Wallpaper installation services offer professional help in installing wallpaper to enhance the aesthetic appeal of your interior spaces.',
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
                    'Cleaning and smoothing walls to ensure proper wallpaper adhesion.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Wallpaper Cutting',
                description:
                    'Accurately measuring and cutting wallpaper to fit your walls perfectly.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Wallpaper Application',
                description:
                    'Applying wallpaper with precision to avoid bubbles and ensure a smooth finish.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Seam Matching',
                description:
                    'Ensuring patterns align perfectly across wallpaper seams for a seamless look.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Trimming and Finishing',
                description:
                    'Cutting excess wallpaper and ensuring all edges are neatly trimmed.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cleanup',
                description:
                    'Removing any debris and ensuring your space is clean and tidy post-installation.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Wallpaper Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Bishal Purja',
                experience: '8 years of experience',
                rating: 4.9,
                imagePath: 'assets/BishalWallpaperInstallation.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BishalWallpaperInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Gita Sharma',
                experience: '5 years of experience',
                rating: 4.8,
                imagePath: 'assets/GitaWallpaperInstallation.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const GitaWallpaperInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Kai Lama',
                experience: '10 years of experience',
                rating: 4.7,
                imagePath: 'assets/KaiWallpaperInstallation.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const KaiWallpaperInstallationPage()));
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
