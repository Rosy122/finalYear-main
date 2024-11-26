import 'package:flutter/material.dart';

class BathroomCleaningPage extends StatelessWidget {
  const BathroomCleaningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bathroom Cleaning Services'),
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
                    image: AssetImage('assets/BathroomCleaning.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              // Text(
              //   'Bathroom Cleaning',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              const SizedBox(height: 10),
              const Text(
                'Our bathroom cleaning services ensure that your bathroom is hygienic, fresh, and sparkling clean.',
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
                service: 'Toilet Cleaning',
                description:
                    'Thorough cleaning and disinfection of the toilet bowl, seat, and surrounding areas.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Shower and Tub Cleaning',
                description:
                    'Deep cleaning of the shower, bathtub, and surrounding tiles.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Sink and Countertop Cleaning',
                description:
                    'Cleaning and sanitizing of sinks, countertops, and faucets.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Mirror and Glass Cleaning',
                description:
                    'Polishing of mirrors and glass surfaces for a streak-free shine.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Floor Cleaning',
                description:
                    'Mopping and scrubbing of bathroom floors to remove dirt and grime.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cabinet and Fixture Cleaning',
                description:
                    'Wiping and dusting of bathroom cabinets and fixtures.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Bathroom Cleaners',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
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
