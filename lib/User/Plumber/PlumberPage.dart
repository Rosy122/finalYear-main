import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Plumber/BathroomInstallationPage.dart';
import 'package:profix_new/User/Plumber/LeakRepairPage.dart';
import 'package:profix_new/User/Plumber/ToiletRepairPage.dart';
import 'package:profix_new/User/PlumberProfiles/PlumberProfilePage.dart';

class PlumberPage extends StatelessWidget {
  const PlumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plumber Services'),
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
              icon: Icons.plumbing,
              service: 'Leak Repair',
              description: 'Fix leaks in pipes and fittings',
              price: 'Rs. 800/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LeakRepairPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.shower,
              service: 'Bathroom Installation',
              description: 'Install new bathroom fixtures',
              price: 'Rs. 1500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BathroomInstallationPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.bathroom,
              service: 'Toilet Repair',
              description: 'Repair and maintenance of toilets',
              price: 'Rs. 600/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToiletRepairPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Plumbers',
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
                  .where('services', arrayContains: 'Plumbing')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No plumbers available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final plumbers = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: plumbers.length,
                  itemBuilder: (context, index) {
                    final plumber = plumbers[index];
                    final plumberData = plumber.data() as Map<String, dynamic>;
                    final name = plumberData['name'] ?? 'Unknown';
                    final experience = plumberData['years_of_experience'] ?? 0;
                    final likes = plumberData['likes'] ?? 0;
                    final profileImage = plumberData['profileImage'] ??
                        'assets/default_profile.jpg';

                    return PlumberProfileTile(
                      name: name,
                      experience: '$experience years of experience',
                      rating: likes.toDouble(),
                      imagePath: profileImage,
                      onTap: () {
                        // Navigate to plumber profile page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlumberProfilePage(
                                providerId: plumber.id), // Adjust accordingly
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

class PlumberProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const PlumberProfileTile({
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

// class PlumberProfilePage extends StatelessWidget {
//   final String providerId;

//   const PlumberProfilePage({super.key, required this.providerId});

//   @override
//   Widget build(BuildContext context) {
//     // Implement profile details for the plumber based on providerId
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plumber Profile'),
//         backgroundColor: const Color.fromARGB(255, 213, 237, 249),
//       ),
//       body: Center(
//         child: Text(
//           'Details for Plumber: $providerId',
//           style: const TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
