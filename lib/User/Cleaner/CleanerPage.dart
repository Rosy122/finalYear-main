import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Cleaner/BathroomCleaningPage.dart';
import 'package:profix_new/User/Cleaner/DeepCleaningPage.dart';
import 'package:profix_new/User/Cleaner/GeneralCleaningPage.dart';
import 'package:profix_new/User/Cleaner/PostConstructionCleaningPage.dart';
import 'package:profix_new/User/Cleaner/WindowCleaningPage.dart';
import 'package:profix_new/User/CleanerProfiles/CleanerProfilePage.dart';

class CleanerPage extends StatefulWidget {
  final String username;
  const CleanerPage({super.key, this.username = "Guest"});

  @override
  State<CleanerPage> createState() => _CleanerPageState();
}

class _CleanerPageState extends State<CleanerPage> {
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    log(widget.username);
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users') // Replace 'Users' with your collection name
          .where('name', isEqualTo: widget.username)
          .get();

      log(querySnapshot.docs.toString());

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          userData = null;
          isLoading = false;
        });
      }

      log(userData!['location'].toString());
    } catch (e) {
      log('Error fetching user data: $e');
      setState(() {
        userData = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaner Services'),
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
              icon: Icons.cleaning_services,
              service: 'General Cleaning',
              description: 'Basic house cleaning tasks',
              price: 'Rs. 500/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GeneralCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.grass,
              service: 'Deep Cleaning',
              description: 'Thorough cleaning including scrubbing and more',
              price: 'Rs. 1000/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeepCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.window,
              service: 'Window Cleaning',
              description: 'Professional window cleaning',
              price: 'Rs. 300/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WindowCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.bathroom,
              service: 'Bathroom Cleaning',
              description: 'Professional bathroom cleaning',
              price: 'Rs. 300/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BathroomCleaningPage(),
                  ),
                );
              },
            ),
            ServiceTile(
              icon: Icons.construction,
              service: 'Post-Construction Cleaning',
              description: 'Professional post-construction cleaning',
              price: 'Rs. 400/hr',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostConstructionCleaningPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Top Cleaners',
              // username,
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
                  .where('services', arrayContains: 'Cleaning')
                  .where('location',
                      isEqualTo: userData?['location'] ?? "kathmandu")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No cleaners available.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  );
                }

                final cleaners = snapshot.data!.docs;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cleaners.length,
                  itemBuilder: (context, index) {
                    final cleaner = cleaners[index];
                    final cleanerData =
                        cleaner.data() as Map<String, dynamic>; // Cast data
                    final name = cleanerData['name'] ?? 'Unknown';
                    final experience = cleanerData['years_of_experience'] ?? 0;
                    final likes = cleanerData['likes'] ?? 0;
                    final profileImage = cleanerData['profileImage'] ??
                        'assets/default_profile.jpg';

                    return CleanerProfileTile(
                      name: name,
                      experience: '$experience years of experience',
                      rating: likes.toDouble(),
                      imagePath: profileImage,
                      onTap: () {
                        // // Increment likes
                        // FirebaseFirestore.instance
                        //     .collection('Service Providers')
                        //     .doc(cleaner.id)
                        //     .update({'likes': FieldValue.increment(1)});

                        // Navigate to profile page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CleanerProfilePage(providerId: cleaner.id),
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

class CleanerProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String imagePath;
  final VoidCallback onTap;

  const CleanerProfileTile({
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
