import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Catering/BuffetCatering.dart';
import 'package:profix_new/User/Catering/CateringProfilePage.dart';
import 'package:profix_new/User/Catering/Platedmeals.dart';
import 'package:profix_new/User/Catering/TeaService.dart';

class CateringPage extends StatelessWidget {
  const CateringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catering Services'),
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
              icon: Icons.fastfood,
              service: 'Buffet Catering',
              description: 'All-you-can-eat buffet for events',
              price: 'Rs. 3000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuffetCateringPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.kitchen,
              service: 'Plated Meals',
              description: 'Serve plated meals for formal occasions',
              price: 'Rs. 2500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlatedMealsPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.coffee,
              service: 'Tea and Coffee Service',
              description: 'Provide tea and coffee for events',
              price: 'Rs. 1500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeaAndCoffeeServicePage(),
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
                      isEqualTo: 'Catering') // Filter by category
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
                      icon: Icons.restaurant, // Example dynamic icon
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
              'Top Caterers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 122, 165, 160),
              ),
            ),
            const SizedBox(height: 10),
            // Fetching Top Caterers
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Service Providers')
                  .where('services', arrayContains: 'Catering')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No caterers available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final caterers = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: caterers.length,
                  itemBuilder: (context, index) {
                    final caterer = caterers[index];
                    final catererData = caterer.data() as Map<String, dynamic>;
                    final name = catererData['name'] ?? 'Unknown';
                    final experience = catererData['years_of_experience'] ?? 0;
                    final likes = catererData['likes'] ?? 0;
                    final profileImage = catererData['profileImage'] ??
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
                            builder: (context) => CateringProfilePage(
                              providerId: caterer.id,
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
