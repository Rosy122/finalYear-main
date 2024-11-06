import 'package:flutter/material.dart';

class SunitaJoshiProfile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String bio;
  final List<String> services;
  final List<Map<String, String>> reviews;
  final String imagePath;

  const SunitaJoshiProfile({super.key, 
    required this.name,
    required this.experience,
    required this.rating,
    required this.bio,
    required this.services,
    required this.reviews,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name\'s Profile'),
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
                    backgroundImage: const AssetImage('assets/SunitadeepCleaner.PNG'),
                    // child: Text(
                    //   name[0],
                    //   style:
                    //       TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    // ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    // Used Expanded to avoid overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 165, 160),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          experience,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                          overflow: TextOverflow.ellipsis, // Ensure no overflow
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[700]),
                            const SizedBox(width: 5),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'About $name',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              Text(
                bio,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify, // Ensure proper text alignment
              ),
              const SizedBox(height: 20),
              const Text(
                'Services Offered',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              ...services.map((service) => ServiceListTile(service: service)),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your booking functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 122, 165, 160),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
}

class ServiceListTile extends StatelessWidget {
  final String service;

  const ServiceListTile({super.key, 
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check, color: Color.fromARGB(255, 122, 165, 160)),
      title: Text(service, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class DetailedReviewTile extends StatelessWidget {
  final Map<String, String>
      review; // Changed to Map to include reviewer and text

  const DetailedReviewTile({super.key, 
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
      title: Text(reviewer, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(reviewText),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SunitaJoshiProfile(
      name: 'Sunita Joshi',
      experience: '4 years of experience in household management services.',
      rating: 4.7,
      bio:
          'With eight years of experience in household management, I bring efficiency and care to every task. I specialize in organizing, cleaning, and managing all household needs to ensure your home runs smoothly.',
      services: [
        'Home Organization',
        'Laundry and Ironing',
        'Grocery Shopping',
        'Meal Preparation',
        'Cleaning and Maintenance'
      ],
      reviews: [
        {
          'reviewerName': 'Rajesh Gupta',
          'reviewText': 'Sunita is incredibly organized and reliable.',
        },
        {
          'reviewerName': 'Priya Mehta',
          'reviewText':
              'She transformed my home into a perfectly managed space!',
        },
        {
          'reviewerName': 'Anjali Singh',
          'reviewText':
              'I couldn’t be happier with the services Sunita provides.',
        },
      ],

      imagePath:
          'assets/SunitadeepCleaner.PNG', // Specify the path to the image asset
    );
  }
}
