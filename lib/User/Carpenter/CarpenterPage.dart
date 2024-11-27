import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Carpenter/CabinetInstallation.dart';
import 'package:profix_new/User/Carpenter/CarpenterProfilePage.dart';
import 'package:profix_new/User/Carpenter/CustomFurniture.dart';
import 'package:profix_new/User/Carpenter/FurnitureRepair.dart';

class CarpenterPage extends StatelessWidget {
  const CarpenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carpenter Services'),
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
            // Static Services
            ServiceTile(
              icon: Icons.build,
              service: 'Furniture Repair',
              description: 'Repair and restoration of furniture',
              price: 'Rs. 1000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FurniturerepairPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.chair,
              service: 'Custom Furniture',
              description: 'Design and build custom furniture',
              price: 'Rs. 2000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomFurniturePage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.home,
              service: 'Cabinet Installation',
              description: 'Install kitchen and bathroom cabinets',
              price: 'Rs. 1500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CabinetInstallationPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            // Dynamic Services
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Services')
                  .where('category',
                      isEqualTo: 'Carpentry') // Filter by category
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No services available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final services = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    final serviceData =
                        service.data() as Map<String, dynamic>; // Cast data
                    final serviceName = serviceData['serviceName'] ?? 'N/A';
                    final description = serviceData['description'] ?? 'N/A';
                    final price = serviceData['price'] ?? 'N/A';

                    return ServiceTile(
                      icon: Icons.construction, // Example dynamic icon
                      service: serviceName,
                      description: description,
                      price: 'Rs. $price/hr',
                      onTap: () {
                        // Navigate to a specific service page (optional)
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Carpenters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            // Fetching Top Carpenters
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Service Providers')
                  .where('services', arrayContains: 'Carpentry')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No carpenters available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final carpenters = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carpenters.length,
                  itemBuilder: (context, index) {
                    final carpenter = carpenters[index];
                    final carpenterData =
                        carpenter.data() as Map<String, dynamic>;
                    final name = carpenterData['name'] ?? 'Unknown';
                    final experience =
                        carpenterData['years_of_experience'] ?? 0;
                    final likes = carpenterData['likes'] ?? 0;
                    final profileImage = carpenterData['profileImage'] ??
                        'assets/default_profile.jpg';

                    return ProfessionalProfileTile(
                      name: name,
                      experience: '$experience years of experience',
                      rating: likes.toDouble(),
                      imagePath: profileImage,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarpenterProfilePage(
                              providerId: carpenter.id,
                            ),
                          ),
                        ); // Navigate to technician profile (optional)
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
        title: Text(
          service,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
