import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MinaCarpenterService extends StatefulWidget {
  final String name;
  final String experience;
  final double rating;
  final String bio;
  final List<String> services;
  final List<Map<String, String>> reviews;
  final String imagePath;
  final String providerId; // Firestore provider ID for likes

  const MinaCarpenterService({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
    required this.bio,
    required this.services,
    required this.reviews,
    required this.imagePath,
    required this.providerId, // Firestore provider ID for likes
  });

  @override
  _MinaCarpenterServiceState createState() => _MinaCarpenterServiceState();
}

class _MinaCarpenterServiceState extends State<MinaCarpenterService> {
  final _reviewTextController = TextEditingController();
  late List<Map<String, String>> reviews;
  bool _isLiked = false;
  int _likes = 0;

  @override
  void initState() {
    super.initState();
    reviews = widget.reviews;
    _fetchLikes();
  }

  // Fetch likes count from Firestore
  Future<void> _fetchLikes() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('service Provider')
        .doc(widget.providerId)
        .get();

    if (snapshot.exists && snapshot['likes'] != null) {
      setState(() {
        _likes = snapshot['likes'];
      });
    }
  }

  void _submitReview() {
    final String reviewText = _reviewTextController.text;

    if (reviewText.isNotEmpty) {
      setState(() {
        reviews.add({'reviewerName': 'Anonymous', 'reviewText': reviewText});
      });

      _reviewTextController.clear();
    }
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });

    if (_isLiked) {
      FirebaseFirestore.instance
          .collection('service Provider')
          .doc(widget.providerId)
          .update({'likes': FieldValue.increment(1)})
          .then((_) => setState(() {
                _likes += 1;
              }))
          .catchError((error) {
            print("Failed to update likes: $error");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}\'s Profile'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage(widget.imagePath),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 165, 160),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(widget.experience,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700])),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[700]),
                            const SizedBox(width: 5),
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                _isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: _toggleLike,
                            ),
                            Text('$_likes likes'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'About ${widget.name}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              Text(widget.bio, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text(
                'Services Offered',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              ...widget.services
                  .map((service) => ServiceListTile(service: service)),
              const SizedBox(height: 20),
              const Text(
                'Reviews',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              ...reviews.map((review) => DetailedReviewTile(review: review)),
              const SizedBox(height: 20),
              _buildReviewForm(),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your booking functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 122, 165, 160),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Book Service',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add a Review',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 122, 165, 160),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _reviewTextController,
          decoration: const InputDecoration(
            labelText: 'Your Review',
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
          minLines: 1,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _submitReview,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 122, 165, 160),
          ),
          child: const Text('Submit Review'),
        ),
      ],
    );
  }
}

class ServiceListTile extends StatelessWidget {
  final String service;

  const ServiceListTile({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          const Icon(Icons.check, color: Color.fromARGB(255, 122, 165, 160)),
      title: Text(service, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class DetailedReviewTile extends StatelessWidget {
  final Map<String, String> review;

  const DetailedReviewTile({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final reviewer = review['reviewerName'] ?? 'Anonymous';
    final reviewText = review['reviewText'] ?? 'No review text provided';
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 122, 165, 160),
        child: Icon(Icons.person, color: Colors.white),
      ),
      title:
          Text(reviewer, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(reviewText),
    );
  }
}

class MinaCarpenterServicePage extends StatelessWidget {
  const MinaCarpenterServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MinaCarpenterService(
      name: 'Mina Sharma',
      experience: '8 years of experience in carpentry services.',
      rating: 4.8,
      bio:
          'Mina Sharma is a highly skilled carpenter specializing in custom furniture and home improvement services. Known for her precision and attention to detail.',
      services: [
        'Furniture Repair',
        'Custom Furniture',
        'Cabinet Installation',
        'Wooden Decks',
      ],
      reviews: [
        {
          'reviewerName': 'Rajesh Kumar',
          'reviewText':
              'Mina did a fantastic job with the custom furniture. Highly recommend her!',
        },
        {
          'reviewerName': 'Sita Patel',
          'reviewText':
              'Very happy with the cabinet installation. Mina is a true professional.',
        },
        {
          'reviewerName': 'Anjali Rai',
          'reviewText':
              'Her work on the furniture repair was excellent. Will definitely hire her again.',
        },
      ],
      imagePath: 'assets/Mina.PNG', // Replace with actual image path
      providerId: 'your_provider_id_here', // Firestore provider ID
    );
  }
}
