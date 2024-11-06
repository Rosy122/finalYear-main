import 'package:flutter/material.dart';
// import 'package:profix_new/CabinetInstallationService.dart'; // Make sure to create this file for the individual service page
// import 'package:profix_new/CabinetProfessional1.dart'; // Replace with actual names of your professional pages
// import 'package:profix_new/CabinetProfessional2.dart';
// import 'package:profix_new/CabinetProfessional3.dart';

class CabinetInstallationPage extends StatelessWidget {
  const CabinetInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cabinet Installation Services'),
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
                        'assets/CabinetInstallation.PNG'), // Update the image path accordingly
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Cabinet installation services include expert assistance in setting up new cabinets and modifying existing ones.',
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
                service: 'New Cabinet Installation',
                description:
                    'Installing new cabinets as per room specifications.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cabinet Repair',
                description:
                    'Repairing existing cabinets to restore functionality.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Customization',
                description: 'Modifying cabinets to fit specific design needs.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Finishing Touches',
                description: 'Adding finishing touches for a polished look.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Cabinet Professionals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Bidhan Shrestha',
                experience: '7 years of experience',
                rating: 4.9,
                imagePath: 'assets/Bidhan.PNG',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CabinetProfessional1Page(), // Make sure to create this page
                  //   ),
                  // );
                },
              ),
              ProfessionalProfileTile(
                name: 'Rupesh Sharma',
                experience: '6 years of experience',
                rating: 4.8,
                imagePath: 'assets/Rupesh.PNG',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CabinetProfessional2Page(), // Make sure to create this page
                  //   ),
                  // );
                },
              ),
              ProfessionalProfileTile(
                name: 'Safal Thapa',
                experience: '9 years of experience',
                rating: 4.7,
                imagePath: 'assets/Safal.PNG',
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const CabinetProfessional3Page(), // Make sure to create this page
                  //   ),
                  // );
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
