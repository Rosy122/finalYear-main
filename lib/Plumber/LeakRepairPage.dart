import 'package:flutter/material.dart';
import 'package:profix_new/PlumberProfiles/GopalLeakRepair.dart';
import 'package:profix_new/PlumberProfiles/RamLeakRepair.dart';
import 'package:profix_new/PlumberProfiles/SitaLeakRepair.dart';
// import 'package:profix/SitaLeakRepairPage.dart';
// import 'package:profix/GopalLeakRepairPage.dart';

class LeakRepairPage extends StatelessWidget {
  const LeakRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leak Repair Services'),
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
                    image: AssetImage('assets/LeakRepair.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Leak repair services ensure that any leaks in your plumbing, roofing, or other structures are fixed promptly and effectively, preventing further damage.',
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
                service: 'Pipe Leak Repair',
                description:
                    'Fixing leaks in water, gas, and sewer pipes to prevent water damage and health hazards.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Roof Leak Repair',
                description:
                    'Sealing and repairing leaks in roofs to prevent water intrusion.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Faucet Leak Repair',
                description:
                    'Repairing or replacing leaky faucets to conserve water and reduce utility bills.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Toilet Leak Repair',
                description:
                    'Fixing leaks in toilets to prevent water waste and potential damage.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Foundation Leak Repair',
                description:
                    'Addressing leaks in the foundation to prevent structural damage and mold growth.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Leak Repair Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Ram Thapa',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/RamLeakRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RamLeakRepairPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sita Sharma',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/SitaLeakRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SitaLeakRepairPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Gopal Lama',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/GopalLeakRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GopalLeakRepairPage()));
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
