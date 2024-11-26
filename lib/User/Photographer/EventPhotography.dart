import 'package:flutter/material.dart';

class EventPhotographyPage extends StatelessWidget {
  const EventPhotographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Photography'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/Event.PNG'), // Add your event photography image path here
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Event photography services capture memorable moments from your special occasions with high-quality images and creative angles.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'What is included:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Corporate Events',
                description: 'Professional coverage of corporate events.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Family Functions',
                description: 'Capturing family events with precision and care.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'High-Resolution Images',
                description: 'Delivery of high-quality, edited event photos.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Candid Moments',
                description:
                    'Capturing natural and candid moments during events.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Event Photographers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              // ProfessionalProfileTile(
              //   name: 'Amit Patel',
              //   experience: '10 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/Amit.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 const AmitPatelPhotographyService(
              //                     name: 'Amit Patel',
              //                     experience:
              //                         '10 years of experience in photography services.',
              //                     rating: 4.9,
              //                     bio:
              //                         'Amit Patel is a skilled photographer with over 10 years of experience, specializing in wedding, portrait, and event photography.',
              //                     services: [
              //                       'Wedding Photography (Rs. 15000/event)',
              //                       'Portrait Photography (Rs. 5000/session)',
              //                       'Event Photography (Rs. 8000/event)',
              //                     ],
              //                     reviews: [
              //                       {
              //                         'reviewerName': 'Sneha Rao',
              //                         'reviewText':
              //                             'Amit’s photography was amazing. Highly recommend!',
              //                       },
              //                       {
              //                         'reviewerName': 'Rajiv Kumar',
              //                         'reviewText':
              //                             'Great quality photos. Very professional!',
              //                       },
              //                       {
              //                         'reviewerName': 'Amit Patel',
              //                         'reviewText':
              //                             'Captured my wedding beautifully. Couldn’t be happier!',
              //                       },
              //                     ],
              //                     imagePath: 'assets/Amit.PNG',
              //                     providerId: 'Amit Patel(Photography)')));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sneha Rao',
              //   experience: '7 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/Sneha.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 const SnehaRaoPhotographyService(
              //                   name: 'Sneha Rao',
              //                   experience:
              //                       '7 years of experience in photography services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Sneha Rao is a talented photographer with 7 years of experience, specializing in wedding, portrait, and event photography.',
              //                   services: [
              //                     'Wedding Photography (Rs. 15000/event)',
              //                     'Portrait Photography (Rs. 5000/session)',
              //                     'Event Photography (Rs. 8000/event)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Amit Patel',
              //                       'reviewText':
              //                           'Sneha’s photos are of the highest quality. Highly recommend!',
              //                     },
              //                     {
              //                       'reviewerName': 'Rajiv Kumar',
              //                       'reviewText':
              //                           'Great experience with Sneha. She captured our event beautifully.',
              //                     },
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'Absolutely loved the wedding photos. Thank you for your great work!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Sneha.PNG',
              //                   providerId: 'Sneha Rao(Photography)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Rajiv Kumar',
              //   experience: '6 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/Rajiv.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 const RajivKumarPhotographyService(
              //                   name: 'Rajiv Kumar',
              //                   experience:
              //                       '6 years of experience in photography services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Rajiv Kumar is a professional photographer with 6 years of experience in wedding, portrait, and event photography.',
              //                   services: [
              //                     'Wedding Photography (Rs. 15000/event)',
              //                     'Portrait Photography (Rs. 5000/session)',
              //                     'Event Photography (Rs. 8000/event)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'Rajiv’s photos were amazing. Definitely recommend!',
              //                     },
              //                     {
              //                       'reviewerName': 'Amit Patel',
              //                       'reviewText':
              //                           'Great quality work. He captured every moment perfectly!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'Fantastic photographer! Made our event special.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Rajiv.PNG',
              //                   providerId: 'Rajiv Kumar(Photography)',
              //                 )));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncludedServiceTile extends StatelessWidget {
  final IconData icon;
  final String service;
  final String description;

  const IncludedServiceTile({
    super.key,
    required this.icon,
    required this.service,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 122, 165, 160)),
      title: Text(
        service,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}

class ProfessionalProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final VoidCallback onTap;
  final String imagePath;

  const ProfessionalProfileTile({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
    required this.onTap,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(experience),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow[700]),
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
