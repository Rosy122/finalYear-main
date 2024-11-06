import 'package:flutter/material.dart';
import 'package:profix_new/PlumberProfiles/RajeshBathroomInstallation.dart';
import 'package:profix_new/PlumberProfiles/SudipBathroomInstallation.dart';
import 'package:profix_new/PlumberProfiles/SumanBathroomInstallation.dart';
// import 'package:profix/SumanBathroomInstallationPage.dart';
// import 'package:profix/AnitaBathroomInstallationPage.dart';
// import 'package:profix/RajBathroomInstallationPage.dart';

class BathroomInstallationPage extends StatelessWidget {
  const BathroomInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bathroom Installation Services'),
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
                    image: AssetImage('assets/BathroomInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Bathroom installation services cover everything from the installation of fixtures to plumbing and tiling, ensuring a complete and functional bathroom setup.',
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
                service: 'Fixture Installation',
                description:
                    'Installation of sinks, toilets, showers, and bathtubs with precision and care.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Plumbing Setup',
                description:
                    'Complete plumbing setup to ensure proper water flow and drainage.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Tile Installation',
                description:
                    'Professional tiling for walls and floors to enhance the bathroom aesthetics.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lighting Installation',
                description:
                    'Installation of appropriate lighting fixtures for a bright and functional bathroom.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Ventilation Setup',
                description:
                    'Installation of ventilation systems to prevent mold and ensure air circulation.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Bathroom Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Sudip Shrestha',
                experience: '12 years of experience',
                rating: 4.9,
                imagePath: 'assets/SudipPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SudipBathroomInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Rajesh Kumar',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/RajeshKumarPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RajeshBathroomInstallationPage()));
                },
              ),
              ProfessionalProfileTile(
                name: 'Suman Rai',
                experience: '8 years of experience',
                rating: 4.7,
                imagePath: 'assets/SumanPlumber.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SumanBathroomInstallationPage()));
                  //               name: 'Raj Karki',
                  //               experience: '8 years of experience in bathroom installations.',
                  //               rating: 4.7,
                  //               bio:
                  //                   'Raj has 8 years of experience in installing bathrooms, providing top-notch services and ensuring client satisfaction.',
                  //               services: [
                  //                 'Lighting Installation',
                  //                 'Fixture Installation',
                  //                 'Tile Installation',
                  //                 'Plumbing Setup'
                  //               ],
                  //               reviews: [
                  //                 {
                  //                   'reviewerName': 'Sujan Thapa',
                  //                   'reviewText':
                  //                       'Raj did a great job with our bathroom installation. Very efficient and skilled!',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Kabita Sharma',
                  //                   'reviewText':
                  //                       'Highly recommend Raj for bathroom installations. Excellent work!',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Kishor Adhikari',
                  //                   'reviewText':
                  //                       'Raj was very professional and did an excellent job!',
                  //                 },
                  //               ],
                  //               imagePath: 'assets/RajBathroomInstaller.PNG',
                  //             )));
                },
              ),
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
