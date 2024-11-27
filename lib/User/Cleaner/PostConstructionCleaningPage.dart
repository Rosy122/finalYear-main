import 'package:flutter/material.dart';

class PostConstructionCleaningPage extends StatelessWidget {
  const PostConstructionCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-Construction Cleaning Services'),
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
                      image: AssetImage('assets/ConstructionCleaning.PNG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                ),
                // Text(
                //   'Post-Construction Cleaning',
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(255, 122, 165, 160),
                //   ),
                // ),
                const SizedBox(height: 10),
                const Text(
                  'Post-construction cleaning involves a thorough cleanup of the construction site to remove debris, dust, and hazardous materials.',
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
                  service: 'Debris Removal',
                  description:
                      'Removal of all construction debris, including wood, metal, and other materials.',
                ),
                const IncludedServiceTile(
                  icon: Icons.check,
                  service: 'Dust and Dirt Removal',
                  description:
                      'Comprehensive dusting and vacuuming of all surfaces and floors.',
                ),
                const IncludedServiceTile(
                  icon: Icons.check,
                  service: 'Window Cleaning',
                  description:
                      'Cleaning of interior and exterior windows to remove construction residue.',
                ),
                const IncludedServiceTile(
                  icon: Icons.check,
                  service: 'Floor Cleaning',
                  description:
                      'Scrubbing and polishing of all types of floors to remove construction marks.',
                ),
                const IncludedServiceTile(
                  icon: Icons.check,
                  service: 'Sanitizing Surfaces',
                  description:
                      'Sanitization of surfaces to ensure a clean and safe environment.',
                ),
                const IncludedServiceTile(
                  icon: Icons.check,
                  service: 'Bathroom and Kitchen Cleaning',
                  description:
                      'Detailed cleaning of bathrooms and kitchens to remove all construction residue.',
                ),
                const SizedBox(height: 20),
                // const Text(
                //   'Top Post-Construction Cleaners',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(255, 122, 165, 160),
                //   ),
                // ),
              ]),
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
          // child: Text(
          //   name[0],
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          // ),
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
