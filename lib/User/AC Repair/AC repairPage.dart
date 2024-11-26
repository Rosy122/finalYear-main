import 'package:flutter/material.dart';
import 'package:profix_new/User/AC%20Repair/ACInstallationPage.dart';
import 'package:profix_new/User/AC%20Repair/ACService.dart';

void main() => runApp(const ACRepairPageApp());

class ACRepairPageApp extends StatelessWidget {
  const ACRepairPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ACRepairPage(),
    );
  }
}

class ACRepairPage extends StatelessWidget {
  const ACRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Repair Services'),
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
                icon: Icons.ac_unit,
                service: 'AC Installation',
                description: 'Install new air conditioning units',
                price: 'Rs. 2000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ACInstallationPage()));
                },
              ),
              // ServiceTile(
              //   icon: Icons.air,
              //   service: 'AC Repair',
              //   description: 'Repair and maintenance of AC units',
              //   price: 'Rs. 1500/hr',
              //   onTap: () {},
              // ),
              ServiceTile(
                icon: Icons.filter_alt,
                service: 'AC Servicing',
                description: 'Regular servicing and cleaning',
                price: 'Rs. 1000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ACServicingPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top AC Repair Technicians',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              // ProfessionalProfileTile(
              //   name: 'Deepak Sharma',
              //   experience: '10 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/DeepakACrepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const DeepakACRepair(
              //                   name: 'Deepak Sharma',
              //                   experience:
              //                       '10 years of experience in AC repair services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Deepak Sharma is an expert in AC repair with a decade of experience. Known for his reliable and efficient service, Deepak ensures your AC system runs smoothly.',
              //                   services: [
              //                     'AC Installation',
              //                     'AC Repair',
              //                     'AC Maintenance',
              //                     'AC Troubleshooting',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Sanjay Gupta',
              //                       'reviewText':
              //                           'Deepak did an excellent job fixing my AC. Highly recommend!',
              //                     },
              //                     {
              //                       'reviewerName': 'Aarti Sharma',
              //                       'reviewText':
              //                           'Reliable and efficient service. Deepak is the best in AC repair.',
              //                     },
              //                     {
              //                       'reviewerName': 'Ravi Kumar',
              //                       'reviewText':
              //                           'Great experience with Deepak. My AC has never worked better.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/DeepakACrepair.PNG',
              //                   providerId: 'Deepak Sharma(Ac Repair)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Suman Rani',
              //   experience: '8 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/SumanACrepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SumanACRepair(
              //                   name: 'Suman Rani',
              //                   experience:
              //                       '8 years of experience in AC repair services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Suman Rani is an experienced AC repair technician with 8 years of expertise. Known for her meticulous work and reliable service, Suman ensures your AC functions perfectly.',
              //                   services: [
              //                     'AC Installation',
              //                     'AC Repair',
              //                     'AC Maintenance',
              //                     'AC Troubleshooting',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Deepak Joshi',
              //                       'reviewText':
              //                           'Suman provided excellent service. My AC is working like new!',
              //                     },
              //                     {
              //                       'reviewerName': 'Anita Rai',
              //                       'reviewText':
              //                           'Highly recommend Suman for her efficient and reliable AC repair service.',
              //                     },
              //                     {
              //                       'reviewerName': 'Raj Kumar',
              //                       'reviewText':
              //                           'Great job by Suman. Very professional and knowledgeable.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/SumanACrepair.PNG',
              //                   providerId: 'Suman Rani(Ac Repair)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Raj Kumar',
              //   experience: '6 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/RajACrepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RajACRepair(
              //                   name: 'Raj Kumar',
              //                   experience:
              //                       '6 years of experience in AC repair services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Raj Kumar is a skilled AC repair technician with 6 years of experience. Known for his attention to detail and prompt service, Raj ensures high-quality repairs and maintenance.',
              //                   services: [
              //                     'AC Installation',
              //                     'AC Repair',
              //                     'AC Maintenance',
              //                     'AC Troubleshooting',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Ravi Sharma',
              //                       'reviewText':
              //                           'Raj did an excellent job repairing my AC. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Priya Patel',
              //                       'reviewText':
              //                           'Very professional and reliable service. My AC works perfectly now.',
              //                     },
              //                     {
              //                       'reviewerName': 'Anil Gupta',
              //                       'reviewText':
              //                           'Raj is very knowledgeable and did a great job. Will use his service again.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RajACrepair.PNG',
              //                   providerId: 'Raj Kumar(Ac Repair)',
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
