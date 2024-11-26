import 'package:flutter/material.dart';
import 'package:profix_new/User/Gardener/GardenDesignPage.dart';
import 'package:profix_new/User/Gardener/LawnMowingPage.dart';
import 'package:profix_new/User/Gardener/PlantingPage.dart';

void main() => runApp(const GardenerPageApp());

class GardenerPageApp extends StatelessWidget {
  const GardenerPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GardenerPage(),
    );
  }
}

class GardenerPage extends StatelessWidget {
  const GardenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gardener Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Available Services',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              const SizedBox(height: 10),
              ServiceTile(
                icon: Icons.grass,
                service: 'Lawn Mowing',
                description: 'Regular lawn mowing and maintenance',
                price: 'Rs. 500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LawnMowingPage()));
                },
              ),
              ServiceTile(
                icon: Icons.local_florist,
                service: 'Planting',
                description: 'Planting flowers and shrubs',
                price: 'Rs. 600/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlantingPage()));
                },
              ),
              ServiceTile(
                icon: Icons.park,
                service: 'Garden Design',
                description: 'Design and layout for new gardens',
                price: 'Rs. 1200/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GardenDesignPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Gardeners',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              // ProfessionalProfileTile(
              //   name: 'Ravi Kumar',
              //   experience: '7 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/RaviGardener.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RaviGardener(
              //                   name: 'Ravi Kumar',
              //                   experience:
              //                       '7 years of experience in gardening services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Ravi Kumar is a skilled gardener with 7 years of experience in maintaining and designing beautiful gardens. He is known for his attention to detail and dedication to client satisfaction.',
              //                   services: [
              //                     'Lawn Mowing',
              //                     'Garden Maintenance',
              //                     'Weed Control',
              //                     'Soil Fertilization',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anjali Joshi',
              //                       'reviewText':
              //                           'Ravi did a fantastic job on our garden. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Suresh Karki',
              //                       'reviewText':
              //                           'Ravi is very knowledgeable and provided excellent service. Our garden looks great!',
              //                     },
              //                     {
              //                       'reviewerName': 'Pratima Singh',
              //                       'reviewText':
              //                           'Ravi’s work exceeded our expectations. Very professional!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RaviGardener.PNG',
              //                   providerId: 'Ravi Kumar(Gardener)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Meera Dhakal',
              //   experience: '5 years of experience',
              //   rating: 4.6,
              //   imagePath: 'assets/MeeraGardener.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const MeeraGardener(
              //                   name: 'Meera Dhakal',
              //                   experience:
              //                       '5 years of experience in gardening services.',
              //                   rating: 4.6,
              //                   bio:
              //                       'Meera Dhakal is a dedicated gardener with 5 years of experience in transforming gardens into beautiful and vibrant spaces. She is known for her creativity and attention to detail.',
              //                   services: [
              //                     'Garden Design',
              //                     'Plant Care',
              //                     'Lawn Maintenance',
              //                     'Pruning and Trimming',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Nisha Shrestha',
              //                       'reviewText':
              //                           'Meera did an amazing job with our garden. Highly recommend her!',
              //                     },
              //                     {
              //                       'reviewerName': 'Keshav Gurung',
              //                       'reviewText':
              //                           'Meera is very professional and provided great service. Our garden has never looked better!',
              //                     },
              //                     {
              //                       'reviewerName': 'Binita Rai',
              //                       'reviewText':
              //                           'Meera’s work is exceptional. She is very creative and attentive to our needs!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/MeeraGardener.PNG',
              //                   providerId: 'Meera Dhakal(Gardener)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Nitin Yadav',
              //   experience: '6 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/NitinGardener.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const NitinGardener(
              //                   name: 'Nitin Yadav',
              //                   experience:
              //                       '6 years of experience in gardening services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Nitin Yadav is an experienced gardener with 6 years of expertise in maintaining and designing beautiful gardens. He is known for his dedication and quality of work.',
              //                   services: [
              //                     'Lawn Maintenance',
              //                     'Tree Pruning',
              //                     'Garden Design',
              //                     'Plant Care',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anita Sharma',
              //                       'reviewText':
              //                           'Nitin did an excellent job with our garden. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Rajesh Kumar',
              //                       'reviewText':
              //                           'Nitin is very professional and provided top-notch service. Our garden looks beautiful!',
              //                     },
              //                     {
              //                       'reviewerName': 'Suman Joshi',
              //                       'reviewText':
              //                           'Nitin’s work exceeded our expectations. He is very attentive to detail!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/NitinGardener.PNG',
              //                   providerId: 'Nitin Yadav(Gardener)',
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
            Text(rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
