import 'package:flutter/material.dart';

void main() => runApp(const DeepCleaningPage());

class DeepCleaningPage extends StatelessWidget {
  const DeepCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Cleaning Services'),
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
                    image: AssetImage('assets/DeepCleaning.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              // Text(
              //   'Deep Cleaning',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              const SizedBox(height: 10),
              const Text(
                'Deep cleaning involves a comprehensive and thorough cleaning of all areas, targeting dirt, grime, and bacteria in hard-to-reach places.',
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
                service: 'Scrubbing Floors',
                description:
                    'Intensive scrubbing of floor surfaces to remove dirt and stains.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cleaning Appliances',
                description:
                    'Deep cleaning of kitchen appliances like ovens, refrigerators, and microwaves.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Bathroom Disinfection',
                description:
                    'Sanitizing and disinfecting all bathroom surfaces, including tiles and faucets.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Window Washing',
                description:
                    'Thorough cleaning of interior and exterior windows.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Carpet and Upholstery Cleaning',
                description:
                    'Deep cleaning of carpets, rugs, and upholstered furniture.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Dusting and Polishing',
                description:
                    'Detailed dusting and polishing of furniture, fixtures, and décor.',
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Top Deep Cleaners',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
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
  final Function() onTap;
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
