import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/User/Cleaner/BathroomCleaningPage.dart';
import 'package:profix_new/User/Cleaner/CleanerProfilePage.dart';
import 'package:profix_new/User/Cleaner/DeepCleaningPage.dart';
import 'package:profix_new/User/Cleaner/GeneralCleaningPage.dart';
import 'package:profix_new/User/Cleaner/PostConstructionCleaningPage.dart';
import 'package:profix_new/User/Cleaner/WindowCleaningPage.dart';

class CleanerPage extends StatelessWidget {
  const CleanerPage({super.key});

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

// class CleanerProfilePage extends StatefulWidget {
//   final String providerId;

//   const CleanerProfilePage({Key? key, required this.providerId})
//       : super(key: key);

//   @override
//   _CleanerProfilePageState createState() => _CleanerProfilePageState();
// }

// class _CleanerProfilePageState extends State<CleanerProfilePage> {
//   Map<String, dynamic>? cleanerData;
//   bool isLoading = true;
//   final TextEditingController _reviewController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchCleanerData();
//   }

//   Future<void> fetchCleanerData() async {
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('Service Providers')
//           .doc(widget.providerId)
//           .get();

//       if (doc.exists) {
//         setState(() {
//           cleanerData = doc.data() as Map<String, dynamic>;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//           cleanerData = null; // Explicitly setting to null
//         });
//       }
//     } catch (e) {
//       print("Error fetching cleaner data: $e");
//       setState(() {
//         isLoading = false;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to fetch profile data: $e")),
//       );
//     }
//   }

//   Future<void> incrementLikes() async {
//     if (cleanerData == null) return; // Prevent increment if data is null

//     try {
//       await FirebaseFirestore.instance
//           .collection('Service Providers')
//           .doc(widget.providerId)
//           .update({
//         'likes': FieldValue.increment(1),
//       });

//       setState(() {
//         cleanerData?['likes'] = (cleanerData?['likes'] ?? 0) + 1;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Thank you for liking!")),
//       );
//     } catch (e) {
//       print("Error incrementing likes: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error liking profile: $e")),
//       );
//     }
//   }

//   Future<void> submitReview() async {
//     if (_reviewController.text.trim().isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please write a review!")),
//       );
//       return;
//     }

//     try {
//       await FirebaseFirestore.instance
//           .collection('Service Providers')
//           .doc(widget.providerId)
//           .collection('Reviews')
//           .add({
//         'review': _reviewController.text.trim(),
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       _reviewController.clear();

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Review submitted successfully!")),
//       );
//     } catch (e) {
//       print("Error submitting review: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to submit review: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     if (cleanerData == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text("Profile Not Found"),
//           backgroundColor: const Color.fromARGB(255, 213, 237, 249),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: const Center(
//           child: Text("The requested profile does not exist."),
//         ),
//       );
//     }

//     final name = cleanerData?['name'] ?? 'Unknown';
//     final experience = cleanerData?['years_of_experience'] ?? 0;
//     final likes = cleanerData?['likes'] ?? 0;
//     final profileImage = cleanerData?['profileImage'] ?? '';
//     final services = cleanerData?['services'] ?? [];
//     final bio = cleanerData?['bio'] ?? "No bio available for this provider.";

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("$name's Profile"),
//         backgroundColor: const Color.fromARGB(255, 213, 237, 249),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: profileImage.isNotEmpty
//                         ? NetworkImage(profileImage)
//                         : null,
//                     child: profileImage.isEmpty
//                         ? const Icon(Icons.person, size: 50)
//                         : null,
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 58, 58, 58),
//                     ),
//                   ),
//                   Text(
//                     "$experience years of experience",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Color.fromARGB(255, 122, 165, 160),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.favorite, color: Colors.red),
//                         onPressed: incrementLikes,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         "$likes likes",
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Color.fromARGB(255, 122, 165, 160),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Bio Section
//             const Text(
//               "About",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 58, 58, 58),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               bio,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color.fromARGB(255, 78, 78, 78),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Services Offered Section
//             const Text(
//               "Services Offered",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 58, 58, 58),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: services.isEmpty
//                   ? [
//                       const Text(
//                         "No services available.",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color.fromARGB(255, 78, 78, 78),
//                         ),
//                       ),
//                     ]
//                   : List.generate(
//                       services.length,
//                       (index) => Row(
//                         children: [
//                           const Icon(Icons.check, color: Colors.green),
//                           const SizedBox(width: 8),
//                           Text(
//                             services[index],
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Color.fromARGB(255, 78, 78, 78),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//             ),
//             const SizedBox(height: 20),

//             // Add Review Section
//             const Text(
//               "Add a Review",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 58, 58, 58),
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _reviewController,
//               decoration: InputDecoration(
//                 hintText: "Write your review here...",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//               ),
//               maxLines: 4,
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: submitReview,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 122, 165, 160),
//               ),
//               child: const Text("Submit Review"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
