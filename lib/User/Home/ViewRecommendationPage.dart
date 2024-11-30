import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/ACRepair%20Profiles/ACRepairProfilePage.dart';
import 'package:profix_new/User/CarpenterProfiles/CarpenterProfilePage.dart';
import 'package:profix_new/User/CleanerProfiles/CleanerProfilePage.dart';
import 'package:profix_new/User/MakeupArtist/MakrupArtistProfilePage.dart';
import 'package:profix_new/User/PhotographerProfiles/PhotographerProfilePage.dart';
import 'package:profix_new/User/PlumberProfiles/PlumberProfilePage.dart';

class ViewRecommendationPage extends StatefulWidget {
  final String username;
  const ViewRecommendationPage({super.key, this.username = 'Guest'});

  @override
  State<ViewRecommendationPage> createState() => _ViewRecommendationPageState();
}

class _ViewRecommendationPageState extends State<ViewRecommendationPage> {
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
          .collection('Users')
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

      log(userData?['location'] ?? 'No location');
    } catch (e) {
      log('Error fetching user data: $e');
      setState(() {
        userData = null;
        isLoading = false;
      });
    }
  }

  Future<Map<String, List<QueryDocumentSnapshot>>>
      getProvidersByCategory() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Service Providers')
        .where('location', isEqualTo: userData?['location'] ?? 'kathmandu')
        .get();

    Map<String, List<QueryDocumentSnapshot>> categorizedProviders = {};

    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      String category = data['category'] ?? 'Other';

      if (!categorizedProviders.containsKey(category)) {
        categorizedProviders[category] = [];
      }
      categorizedProviders[category]!.add(doc);
    }

    return categorizedProviders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDE8E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCDE8E5),
        title: const Text('Recommended Providers'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFFCDE8E5),
            ),
          ),
          Expanded(
            flex: 12,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: const Color(0xFFEEF7FF),
                child: FutureBuilder<Map<String, List<QueryDocumentSnapshot>>>(
                  future: getProvidersByCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No providers available.'));
                    }

                    var categorizedProviders = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: categorizedProviders.keys.length,
                      itemBuilder: (context, index) {
                        String category =
                            categorizedProviders.keys.elementAt(index);
                        var providers = categorizedProviders[category]!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category Header
                            Text(
                              category,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // List of Providers in the Category
                            ...providers.map((provider) {
                              var data =
                                  provider.data() as Map<String, dynamic>;
                              String experience =
                                  data.containsKey('years_of_experience')
                                      ? '${data['years_of_experience']} years'
                                      : 'No experience available';
                              String bio = data['bio'] ?? 'No bio available';
                              String name = data['name'] ?? 'No name available';
                              String profileImage = data['profileImage'] ?? '';
                              String serviceType = (data['service type'] ?? '')
                                  .trim()
                                  .toLowerCase();

                              return RecommendedItem(
                                title: name,
                                by: bio,
                                rating: data['likes'].toString(),
                                experience: experience,
                                imageUrl: profileImage,
                                onTap: () {
                                  // Navigate to the appropriate profile page
                                  if (serviceType == "plumbing") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PlumberProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else if (serviceType == "cleaning") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CleanerProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else if (serviceType == "makeup artist") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MakeupArtistProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else if (serviceType == "ac repair") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ACRepairProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else if (serviceType == "carpentry") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CarpenterProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else if (serviceType == "photographer") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PhotographerProfilePage(
                                                providerId: provider.id),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'No profile page available!')),
                                    );
                                  }
                                },
                              );
                            }).toList(),

                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(0, 0, 70, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RecommendedItem extends StatelessWidget {
  final String title;
  final String by;
  final String rating;
  final String experience;
  final String imageUrl;
  final VoidCallback onTap;

  const RecommendedItem({
    super.key,
    required this.title,
    required this.by,
    required this.rating,
    required this.experience,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : const AssetImage('assets/default_profile.jpg')
                        as ImageProvider,
                radius: 30,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bio: $by',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Experience: $experience',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.red, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating likes',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
