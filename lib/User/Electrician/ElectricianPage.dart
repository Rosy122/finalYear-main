import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Electrician/ElectricalRepairPage.dart';
import 'package:profix_new/User/Electrician/LightingInstallationPage.dart';
import 'package:profix_new/User/Electrician/WiringInstallationPage.dart';
import 'package:profix_new/User/ElectricianProfiles/ElectricianProfilePage.dart'; // Replace with the actual path for the profile page

class ElectricianPage extends StatelessWidget {
  const ElectricianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrician Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Available Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            ServiceTile(
              icon: Icons.electrical_services,
              service: 'Wiring Installation',
              description: 'Install or upgrade electrical wiring',
              price: 'Rs. 1000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WiringInstallationPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.lightbulb,
              service: 'Lighting Installation',
              description: 'Install new lighting fixtures',
              price: 'Rs. 800/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LightingInstallationPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.bolt,
              service: 'Electrical Repair',
              description: 'Fix electrical faults and issues',
              price: 'Rs. 1200/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ElectricalRepairPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Electricians',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Service Providers')
                  .where('services',
                      arrayContains: 'Electrician') // Fetch only electricians
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No electricians available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final electricians = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: electricians.length,
                  itemBuilder: (context, index) {
                    final electrician = electricians[index];
                    final electricianData =
                        electrician.data() as Map<String, dynamic>;
                    final name = electricianData['name'] ?? 'Unknown';
                    final experience =
                        electricianData['years_of_experience'] ?? 0;
                    final likes = electricianData['likes'] ?? 0;
                    final profileImage = electricianData['profileImage'] ??
                        'assets/default_profile.jpg';

                    return ElectricianProfileTile(
                      name: name,
                      experience: '$experience years of experience',
                      rating: likes.toDouble(),
                      imagePath: profileImage,
                      onTap: () {
                        // Navigate to electrician profile page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ElectricianProfilePage(
                              providerId: electrician.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: const Color.fromARGB(255, 122, 165, 160),
        ),
        title:
            Text(service, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(price),
        onTap: onTap,
      ),
    );
  }
}

class ElectricianProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const ElectricianProfileTile({
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: imagePath.isNotEmpty
              ? NetworkImage(imagePath)
              : const AssetImage('assets/default_profile.jpg') as ImageProvider,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(experience),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.thumb_up, color: Colors.blue[700]),
            const SizedBox(width: 4),
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
