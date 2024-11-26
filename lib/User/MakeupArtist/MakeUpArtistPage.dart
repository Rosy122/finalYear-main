import 'package:flutter/material.dart';
import 'package:profix_new/User/MakeupArtist/BridalMakeup.dart';
import 'package:profix_new/User/MakeupArtist/PartyMakeup.dart';
import 'package:profix_new/User/MakeupArtist/SpecialOccasion.dart';

void main() => runApp(const MakeupArtistPageApp());

class MakeupArtistPageApp extends StatelessWidget {
  const MakeupArtistPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MakeupArtistPage(),
    );
  }
}

class MakeupArtistPage extends StatelessWidget {
  const MakeupArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makeup Artist Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Available Services',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              SizedBox(height: 10),
              ServiceTile(
                icon: Icons.brush,
                service: 'Bridal Makeup',
                description: 'Expert makeup for your special day',
                price: 'Rs. 8000/event',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BridalMakeupPage()));
                },
              ),
              ServiceTile(
                icon: Icons.face,
                service: 'Party Makeup',
                description: 'Glamorous makeup for parties and events',
                price: 'Rs. 4000/session',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PartyMakeupPage()));
                },
              ),
              ServiceTile(
                icon: Icons.accessibility,
                service: 'Special Occasion Makeup',
                description: 'Makeup for various special occasions',
                price: 'Rs. 5000/session',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SpecialOccasionMakeupPage()));
                },
              ),
              SizedBox(height: 20),
              Text(
                'Top Makeup Artists',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              // ProfessionalProfileTile(
              //   name: 'Priya Singh',
              //   experience: '8 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/Priya.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const PriyaSinghMakeupService(
              //                   name: 'Priya Singh',
              //                   experience:
              //                       '8 years of experience in makeup artistry.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Priya Singh is a skilled makeup artist with 8 years of experience specializing in bridal, party, and special occasion makeup.',
              //                   services: [
              //                     'Bridal Makeup (Rs. 8000/event)',
              //                     'Party Makeup (Rs. 4000/session)',
              //                     'Special Occasion Makeup (Rs. 5000/session)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anita Sharma',
              //                       'reviewText':
              //                           'Priya’s bridal makeup was fantastic. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Ravi Mehta',
              //                       'reviewText':
              //                           'She did an amazing job for the party makeup.',
              //                     },
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'Her makeup skills are exceptional. Loved the outcome!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Priya.PNG',
              //                   providerId: 'Priya Singh(Makeup)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Anita Sharma',
              //   experience: '6 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/Anita.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const AnitaSharmaMakeupService(
              //                   name: 'Anita Sharma',
              //                   experience:
              //                       '6 years of experience in makeup artistry.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Anita Sharma is a professional makeup artist with 6 years of experience specializing in bridal, party, and special occasion makeup.',
              //                   services: [
              //                     'Bridal Makeup (Rs. 8000/event)',
              //                     'Party Makeup (Rs. 4000/session)',
              //                     'Special Occasion Makeup (Rs. 5000/session)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Priya Singh',
              //                       'reviewText':
              //                           'Anita is amazing! She did fantastic work for my wedding.',
              //                     },
              //                     {
              //                       'reviewerName': 'Ravi Mehta',
              //                       'reviewText':
              //                           'The makeup for the event was flawless. Highly recommend!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'Loved her skills! Will definitely book her again.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Anita.PNG',
              //                   providerId: 'Anita Sharma(Makeup)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Ravi Mehta',
              //   experience: '5 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/RaviM.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RaviMehtaMakeupService(
              //                   name: 'Ravi Mehta',
              //                   experience:
              //                       '5 years of experience in makeup artistry.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Ravi Mehta is a talented makeup artist with 5 years of experience, offering bridal, party, and special occasion makeup services.',
              //                   services: [
              //                     'Bridal Makeup (Rs. 8000/event)',
              //                     'Party Makeup (Rs. 4000/session)',
              //                     'Special Occasion Makeup (Rs. 5000/session)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anita Sharma',
              //                       'reviewText':
              //                           'Ravi did an excellent job on my bridal makeup. Loved it!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sneha Rao',
              //                       'reviewText':
              //                           'He’s amazing at what he does. Highly recommend!',
              //                     },
              //                     {
              //                       'reviewerName': 'Priya Singh',
              //                       'reviewText':
              //                           'His makeup skills are top-notch. Will hire again.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RaviM.PNG',
              //                   providerId: 'Ravi Mehta(Makeup)',
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
      child: ListTile(
        leading: CircleAvatar(
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
