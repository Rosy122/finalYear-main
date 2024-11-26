import 'package:flutter/material.dart';

// import 'package:profix/SitaLeakRepairPage.dart';
// import 'package:profix/GopalLeakRepairPage.dart';

class LeakRepairPage extends StatelessWidget {
  const LeakRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leak Repair Services'),
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
                    image: AssetImage('assets/LeakRepair.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Leak repair services ensure that any leaks in your plumbing, roofing, or other structures are fixed promptly and effectively, preventing further damage.',
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
                service: 'Pipe Leak Repair',
                description:
                    'Fixing leaks in water, gas, and sewer pipes to prevent water damage and health hazards.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Roof Leak Repair',
                description:
                    'Sealing and repairing leaks in roofs to prevent water intrusion.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Faucet Leak Repair',
                description:
                    'Repairing or replacing leaky faucets to conserve water and reduce utility bills.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Toilet Leak Repair',
                description:
                    'Fixing leaks in toilets to prevent water waste and potential damage.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Foundation Leak Repair',
                description:
                    'Addressing leaks in the foundation to prevent structural damage and mold growth.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Leak Repair Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              // ProfessionalProfileTile(
              //   name: 'Ram Thapa',
              //   experience: '10 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/RamLeakRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RamLeakRepairProfile(
              //                   name: 'Ram Thapa',
              //                   experience:
              //                       '10 years of experience in leak repair services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Ram Thapa has been providing professional leak repair services for over a decade. He specializes in detecting and fixing leaks with precision and efficiency.',
              //                   services: [
              //                     'Water Pipe Leak Repair',
              //                     'Faucet Leak Fixing',
              //                     'Toilet Leak Repair',
              //                     'Roof and Ceiling Leak Repair'
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Bikash Tamang',
              //                       'reviewText':
              //                           'Ram did a fantastic job fixing our leaking pipes. He was quick and efficient.',
              //                     },
              //                     {
              //                       'reviewerName': 'Anjana KC',
              //                       'reviewText':
              //                           'Highly recommend Ram for any leak repair needs. He fixed our roof leak with great attention to detail.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RamLeakRepair.PNG',
              //                   providerId: 'Y2N4aReSGaGxrqHKLf8M',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sita Sharma',
              //   experience: '7 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/SitaLeakRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SitaLeakRepairProfile(
              //                   name: 'Sita Sharma',
              //                   experience:
              //                       '7 years of experience in leak repair services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Sita Sharma is a highly skilled professional with 7 years of experience in leak repair services. She is known for her meticulous approach and dedication to resolving even the most challenging leaks efficiently.',
              //                   services: [
              //                     'Water Pipe Leak Repair',
              //                     'Faucet Leak Fixing',
              //                     'Toilet Leak Repair',
              //                     'Roof and Ceiling Leak Repair',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Ramesh Thapa',
              //                       'reviewText':
              //                           'Sita provided excellent service. She was prompt and fixed the leak quickly and efficiently.',
              //                     },
              //                     {
              //                       'reviewerName': 'Gita Sharma',
              //                       'reviewText':
              //                           'I highly recommend Sita for any leak repairs. Her work is of the highest quality, and she is very professional.',
              //                     },
              //                     {
              //                       'reviewerName': 'Prakash Shrestha',
              //                       'reviewText':
              //                           'Sita\'s attention to detail is impressive. She fixed our toilet leak perfectly, and we haven’t had any issues since.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/SitaLeakRepair.PNG',
              //                   providerId: 'A2iTZkuKdqTVQRmUzemC',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Gopal Lama',
              //   experience: '12 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/GopalLeakRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const GopalLeakRepair(
              //                   name: 'Gopal Lama',
              //                   experience:
              //                       '12 years of experience in leak repair services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Gopal Lama has been in the leak repair industry for 12 years. His extensive experience and technical skills make him a reliable choice for resolving any kind of leak issue.',
              //                   services: [
              //                     'Water Pipe Leak Repair',
              //                     'Faucet Leak Fixing',
              //                     'Toilet Leak Repair',
              //                     'Roof and Ceiling Leak Repair',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anita Khadka',
              //                       'reviewText':
              //                           'Gopal was very professional and resolved the issue quickly. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Bikash Karki',
              //                       'reviewText':
              //                           'Very satisfied with Gopal’s service. He was thorough and ensured everything was fixed properly.',
              //                     },
              //                     {
              //                       'reviewerName': 'Sunita Gurung',
              //                       'reviewText':
              //                           'Gopal is very experienced and reliable. We had a major leak, and he handled it expertly.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/GopalLeakRepair.PNG',
              //                   providerId: 'ZWi1wIBOusqb9wFvnA6p',
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
