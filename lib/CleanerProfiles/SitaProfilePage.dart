import 'package:flutter/material.dart';

class Sitaprofilepage extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final String bio;
  final List<String> services;
  final List<String> reviews;
  final String imagePath;

  const Sitaprofilepage({super.key, 
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
                    backgroundImage: const AssetImage('assets/SitaRaiCleaner.PNG'),
                    child: Text(
                      name[0],
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
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
                      Text(experience,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700])),
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
              Text(bio, style: const TextStyle(fontSize: 16)),
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
              ...reviews.map((review) => ReviewListTile(review: review)),
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

class ReviewListTile extends StatelessWidget {
  final String review;

  const ReviewListTile({super.key, 
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person, color: Color.fromARGB(255, 122, 165, 160)),
      title: Text(review),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Sitaprofilepage(
      name: 'Sita Ram',
      experience: '5 years of experience in home cleaning and maintenance.',
      rating: 4.7,
      bio:
          'I am dedicated to providing high-quality cleaning and maintenance services. My goal is to ensure customer satisfaction with every service I provide.',
      services: [
        'Home Cleaning',
        'Kitchen Cleaning',
        'Office Cleaning',
        'Window Washing',
        'Carpet Cleaning'
      ],
      reviews: [
        'Great service, very thorough and professional.',
        'Sita was fantastic, our house has never looked better!',
        'Highly recommended, very reliable and friendly.',
      ],
      imagePath:
          'assets/SitaRaiCleaner.PNG', // Specify the path to the image asset
    );
  }
}
