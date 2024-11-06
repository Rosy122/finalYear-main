import 'package:flutter/material.dart';
import 'package:profix_new/PlumberProfiles/AnilPlumberProfile.dart';
import 'package:profix_new/Plumber/BathroomInstallationPage.dart';
import 'package:profix_new/Plumber/LeakRepairPage.dart';
import 'package:profix_new/PlumberProfiles/RajeshPlumberProfilePage.dart';
import 'package:profix_new/PlumberProfiles/RomanPlumberProfile.dart';
import 'package:profix_new/PlumberProfiles/SudipPlumberProfile.dart';
import 'package:profix_new/PlumberProfiles/SumanPlumberProfile.dart';
import 'package:profix_new/Plumber/ToiletRepairPage.dart';

void main() => runApp(const PlumberPageApp());

class PlumberPageApp extends StatelessWidget {
  const PlumberPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlumberPage(),
    );
  }
}

class PlumberPage extends StatelessWidget {
  const PlumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plumber Services'),
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
                icon: Icons.plumbing,
                service: 'Leak Repair',
                description: 'Fix leaks in pipes and fittings',
                price: 'Rs. 800/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LeakRepairPage()));
                },
              ),
              ServiceTile(
                icon: Icons.shower,
                service: 'Bathroom Installation',
                description: 'Install new bathroom fixtures',
                price: 'Rs. 1500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BathroomInstallationPage()));
                },
              ),
              ServiceTile(
                icon: Icons.bathroom,
                service: 'Toilet Repair',
                description: 'Repair and maintenance of toilets',
                price: 'Rs. 600/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToiletRepairPage()));
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Plumbers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              PlumberProfileTile(
                name: 'Rajesh Kumar',
                experience: '8 years of experience',
                rating: 4.7,
                imagePath: 'assets/RajeshKumarPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RajeshPlumberProfile(
                                name: 'Rajesh Kumar',
                                experience:
                                    '8 years of experience in professional plumbing services.',
                                rating: 4.7,
                                bio:
                                    'With 8 years of experience in plumbing, I specialize in fixing leaks, installing pipes, and ensuring that all plumbing systems are functioning smoothly. My work is thorough, and I strive for customer satisfaction in every job I undertake.',
                                services: [
                                  'Leak Repair',
                                  'Pipe Installation',
                                  'Bathroom and Kitchen Plumbing',
                                  'Emergency Plumbing Services'
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Arjun Shrestha',
                                    'reviewText':
                                        'Rajesh was quick and efficient in fixing the leak in our bathroom. Great service!',
                                  },
                                  {
                                    'reviewerName': 'Mina Koirala',
                                    'reviewText':
                                        'He did a fantastic job installing new pipes in our kitchen. Highly recommend!',
                                  },
                                  {
                                    'reviewerName': 'Suman Gurung',
                                    'reviewText':
                                        'Very professional and knowledgeable. Solved our plumbing issue with ease.',
                                  },
                                ],
                                imagePath: 'assets/RajeshKumarPlumber.PNG',
                                providerId: ,
                                
                              )));
                },
              ),
              PlumberProfileTile(
                name: 'Anil Sharma',
                experience: '5 years of experience',
                rating: 4.5,
                imagePath: 'assets/AnilPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnilPlumberProfile(
                              name: 'Anil',
                              experience:
                                  '5 years of experience in plumbing services.',
                              rating: 4.5,
                              bio:
                                  'With 5 years of experience in plumbing, I specialize in pipe repairs, leak fixing, and installation services. I am committed to providing quality and timely plumbing solutions.',
                              services: [
                                'Pipe Repair',
                                'Leak Fixing',
                                'Installation of Fixtures',
                                'General Plumbing Maintenance'
                              ],
                              reviews: [
                                {
                                  'reviewerName': 'Kiran Lama',
                                  'reviewText':
                                      'Anil was quick and efficient in fixing the leak in my kitchen. Highly recommended!',
                                },
                                {
                                  'reviewerName': 'Sneha Thapa',
                                  'reviewText':
                                      'Professional service. Anil did a great job with the pipe installation.',
                                },
                                {
                                  'reviewerName': 'Manoj Shrestha',
                                  'reviewText':
                                      'Very satisfied with the plumbing maintenance Anil provided. Will hire again!',
                                },
                              ],
                              imagePath: 'assets/AnilPlumber.PNG',
                              providerId: ,
                              )));
                              
                },
              ),
              PlumberProfileTile(
                name: 'Suman Rai',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/SumanPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SumanPlumberProfile(
                                name: 'Suman',
                                experience: '7 years of plumbing experience.',
                                rating: 4.8,
                                bio:
                                    'With 7 years of experience in plumbing, I specialize in leak repairs, pipe installations, and bathroom fittings. Dedicated to providing efficient and reliable services.',
                                services: [
                                  'Leak Repairs',
                                  'Pipe Installations',
                                  'Bathroom Fittings',
                                  'Drain Unclogging',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Rohit Thapa',
                                    'reviewText':
                                        'Suman was very efficient in fixing my bathroom pipe. Great service!',
                                  },
                                  {
                                    'reviewerName': 'Meera Shrestha',
                                    'reviewText':
                                        'Quick and professional. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Gopal Gurung',
                                    'reviewText':
                                        'Solved my plumbing issues with ease. Will definitely call again.',
                                  },
                                ],
                                imagePath: 'assets/SumanPlumber.PNG',
                              )));
                },
              ),
              PlumberProfileTile(
                name: 'Sudip Shrestha',
                experience: '5 years of experience',
                rating: 4.8,
                imagePath: 'assets/SudipPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SudipPlumberProfile(
                                name: 'Sudip Shrestha',
                                experience:
                                    '5 years of experience in professional plumbing services.',
                                rating: 4.8,
                                bio:
                                    'Sudip Shrestha has 5 years of experience in providing top-notch plumbing services, specializing in both residential and commercial plumbing solutions. He is committed to delivering high-quality work with attention to detail and customer satisfaction.',
                                services: [
                                  'Leak Repair',
                                  'Pipe Installation',
                                  'Bathroom and Kitchen Plumbing',
                                  'Emergency Plumbing Services'
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Kamal Rai',
                                    'reviewText':
                                        'Sudip was very thorough and professional. I am extremely satisfied with his work!',
                                  },
                                  {
                                    'reviewerName': 'Nisha Bhattarai',
                                    'reviewText':
                                        'Quick and efficient service. Sudip is very knowledgeable and reliable.',
                                  },
                                  {
                                    'reviewerName': 'Sita Gurung',
                                    'reviewText':
                                        'Excellent service! Sudip fixed our plumbing issues in no time.',
                                  },
                                ],
                                imagePath: 'assets/SudipPlumber.PNG',
                              )));
                },
              ),
              PlumberProfileTile(
                name: 'Roman Yadav',
                experience: '6 years of experience',
                rating: 4.8,
                imagePath: 'assets/RomanPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RomanPlumberProfile(
                                name: 'Roman Yadav',
                                experience:
                                    '6 years of experience in professional plumbing services.',
                                rating: 4.8,
                                bio:
                                    'With 6 years of experience, I specialize in providing top-notch plumbing services, from leak repairs to full bathroom installations. My commitment is to quality and customer satisfaction.',
                                services: [
                                  'Leak Repair',
                                  'Pipe Installation',
                                  'Bathroom and Kitchen Plumbing',
                                  'Emergency Plumbing Services'
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Hari Bahadur',
                                    'reviewText':
                                        'Roman was quick and efficient. Our plumbing issue was resolved in no time!',
                                  },
                                  {
                                    'reviewerName': 'Sita Sharma',
                                    'reviewText':
                                        'Great service, very professional and courteous. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Kiran Thapa',
                                    'reviewText':
                                        'Roman did a fantastic job with our bathroom plumbing. Will definitely hire again!',
                                  },
                                ],
                                imagePath: 'assets/RomanPlumber.PNG',
                              )));
                },
              ),
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

class PlumberProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  final VoidCallback onTap;
  final String imagePath;

  const PlumberProfileTile({
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
          backgroundColor: Colors.grey[300],
          backgroundImage: AssetImage(imagePath),
          // child: Icon(Icons.person, color: Colors.white),
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
