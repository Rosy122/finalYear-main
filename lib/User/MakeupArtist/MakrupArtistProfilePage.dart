import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/BookNow.dart'; // Replace with your booking page path.

class MakeupArtistProfilePage extends StatefulWidget {
  final String providerId;

  const MakeupArtistProfilePage({Key? key, required this.providerId})
      : super(key: key);

  @override
  _MakeupArtistProfilePageState createState() =>
      _MakeupArtistProfilePageState();
}

class _MakeupArtistProfilePageState extends State<MakeupArtistProfilePage> {
  Map<String, dynamic>? makeupArtistData;
  bool isLoading = true;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMakeupArtistData();
  }

  Future<void> fetchMakeupArtistData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .get();

      if (doc.exists) {
        setState(() {
          makeupArtistData = doc.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          makeupArtistData = null;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> incrementLikes() async {
    try {
      await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .update({'likes': FieldValue.increment(1)});

      setState(() {
        makeupArtistData?['likes'] = (makeupArtistData?['likes'] ?? 0) + 1;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Thank you for liking!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to like profile: $e")),
      );
    }
  }

  Future<void> submitReview() async {
    final reviewText = _reviewController.text.trim();

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write a review!")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .collection('Reviews')
          .add({
        'reviewText': reviewText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _reviewController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Review submitted successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to submit review: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (makeupArtistData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Not Found"),
          backgroundColor: const Color(0xFFCDE8E5),
        ),
        body: const Center(
          child: Text("The requested profile does not exist."),
        ),
      );
    }

    final name = makeupArtistData?['name'] ?? 'Unknown';
    final experience = makeupArtistData?['years_of_experience'] ?? 0;
    final likes = makeupArtistData?['likes'] ?? 0;
    final profileImage = makeupArtistData?['profileImage'] ?? '';
    final services = makeupArtistData?['services'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("$name's Profile"),
        backgroundColor: const Color(0xFFCDE8E5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFCDE8E5), Color(0xFFEEF7FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: profileImage.isNotEmpty
                        ? NetworkImage(profileImage)
                        : const AssetImage('assets/default_profile.jpg')
                            as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF4A4B4B),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$experience years of experience",
                    style: const TextStyle(
                      color: Color(0xFF7AA5A0),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up,
                            color: Color(0xFF7AA5A0)),
                        onPressed: incrementLikes,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "$likes likes",
                        style: const TextStyle(
                          color: Color(0xFF7AA5A0),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // About Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "About",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A4B4B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        makeupArtistData?['bio'] ??
                            "No bio available for this provider.",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 78, 78),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Services Offered Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Services Offered",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A4B4B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...services.map(
                        (service) => ListTile(
                          title: Text(service),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookServicePage(
                                    providerId: widget.providerId,
                                    providerName: name,
                                    serviceName: service,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7AA5A0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Book",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Add Review Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add a Review",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A4B4B),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _reviewController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Write your review...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: submitReview,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7AA5A0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
