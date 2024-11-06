import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewRecommendationPage extends StatelessWidget {
  const ViewRecommendationPage({super.key});

  Stream<QuerySnapshot> getTopLikedProviders() {
    return FirebaseFirestore.instance
        .collection(
            'service Provider') // Ensure this matches your Firestore collection name
        .orderBy('likes',
            descending: true) // Sort by likes instead of averageRating
        .snapshots();
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: getTopLikedProviders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                          child: Text('No providers available.'));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var provider = snapshot.data!.docs[index];
                        return RecommendedItem(
                          title: provider['name'], // Using 'name' field
                          by: provider['bio'], // Using 'bio' field
                          rating: provider['likes']
                              .toString(), // Using 'likes' field
                          experience: provider[
                              'Experience'], // Using 'Experience' field
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

  const RecommendedItem({
    super.key,
    required this.title,
    required this.by,
    required this.rating,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Bio: $by'),
            Text('Experience: $experience'),
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 16),
                Text('$rating likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
