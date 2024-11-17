import 'package:flutter/material.dart';
import 'package:profix_new/ElectricianProfiles/KrishnaElectricalRepair.dart';
import 'package:profix_new/ElectricianProfiles/LaxmiElectricalRepair.dart';
import 'package:profix_new/ElectricianProfiles/SalinaElectricalRepair.dart';
// import 'package:profix/RamElectricalRepair.dart';
// import 'package:profix/SitaElectricalRepair.dart';
// import 'package:profix/GopalElectricalRepair.dart';

class ElectricalRepairPage extends StatelessWidget {
  const ElectricalRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electrical Repair Services'),
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
                    image: AssetImage('assets/ElectricalRepair.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Electrical repair services address any issues with your electrical systems, ensuring safety and functionality in your home or office.',
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
                service: 'Fault Diagnosis',
                description:
                    'Identifying and diagnosing electrical faults in wiring, outlets, and appliances.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Wiring Repairs',
                description:
                    'Repairing damaged or faulty wiring to prevent electrical hazards.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Outlet & Switch Repairs',
                description:
                    'Fixing malfunctioning outlets and switches to ensure proper functionality.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Circuit Breaker Repairs',
                description:
                    'Repairing or replacing faulty circuit breakers to prevent electrical overloads.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lighting Repairs',
                description:
                    'Fixing issues with indoor and outdoor lighting systems to ensure proper illumination.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Electrical Repair Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Laxmi Thapa',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/LaxmiElectricalRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LaxmiElectricalRepair(
                                name: 'Laxmi Thapa',
                                experience:
                                    '10 years of experience in electrical repair services.',
                                rating: 4.9,
                                bio:
                                    'Laxmi Thapa has been providing expert electrical repair services for 10 years. Her deep knowledge and skills ensure safe and reliable solutions for all electrical issues.',
                                services: [
                                  'Circuit Breaker Repair',
                                  'Wiring Repair',
                                  'Electrical Outlet Repair',
                                  'Electrical Safety Inspections',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Suman Gurung',
                                    'reviewText':
                                        'Laxmi was very thorough and professional. She fixed the issue quickly and efficiently.',
                                  },
                                  {
                                    'reviewerName': 'Maya Rai',
                                    'reviewText':
                                        'Extremely satisfied with Laxmi’s service. She is knowledgeable and very reliable.',
                                  },
                                  {
                                    'reviewerName': 'Anil Shrestha',
                                    'reviewText':
                                        'Laxmi’s work is excellent. She resolved our electrical problems with great skill.',
                                  },
                                ],
                                imagePath:
                                    'assets/LaxmiElectricalRepair.PNG', // Specify the correct path to the image asset
                                providerId: 'Laxmi Thapa(Electrical Repair)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Krishna Sharma',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/KrishnaElectricalRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KrishnaElectricalRepair(
                                name: 'Krishna Sharma',
                                experience:
                                    '7 years of experience in electrical repair services.',
                                rating: 4.8,
                                bio:
                                    'Krishna Sharma has been providing expert electrical repair services for 7 years. His commitment to quality and safety makes him a trusted choice for any electrical repair needs.',
                                services: [
                                  'Fuse Box Repair',
                                  'Electrical Wiring Troubleshooting',
                                  'Appliance Wiring Repair',
                                  'Lighting Repair and Replacement',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Puja Lama',
                                    'reviewText':
                                        'Krishna was prompt and professional. He fixed the wiring issue efficiently.',
                                  },
                                  {
                                    'reviewerName': 'Ram Thapa',
                                    'reviewText':
                                        'Very satisfied with Krishna’s work. He is reliable and skilled.',
                                  },
                                  {
                                    'reviewerName': 'Sita Rai',
                                    'reviewText':
                                        'Krishna provided excellent service. Our electrical problems were solved quickly.',
                                  },
                                ],
                                imagePath: 'assets/KrishnaElectricalRepair.PNG',
                                providerId: 'Krishna Sharma(Electrical repair)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Salina Lama',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/SalinaElectricalRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalinaElectricalRepair(
                                name: 'Salina Lama',
                                experience:
                                    '12 years of experience in electrical repair services.',
                                rating: 4.7,
                                bio:
                                    'Salina Lama has been providing top-notch electrical repair services for 12 years. Her expertise and attention to detail ensure reliable and safe electrical solutions.',
                                services: [
                                  'Fuse Box Repair',
                                  'Electrical Wiring Troubleshooting',
                                  'Appliance Wiring Repair',
                                  'Lighting Repair and Replacement',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Anil Tamang',
                                    'reviewText':
                                        'Salina did a great job fixing the electrical issues in our home. Very professional!',
                                  },
                                  {
                                    'reviewerName': 'Rita Magar',
                                    'reviewText':
                                        'Salina is highly skilled and trustworthy. I would definitely recommend her services.',
                                  },
                                  {
                                    'reviewerName': 'Kiran Gurung',
                                    'reviewText':
                                        'Very satisfied with Salina’s work. She is thorough and efficient.',
                                  },
                                ],
                                imagePath: 'assets/SalinaElectricalRepair.PNG',
                                providerId: 'Salina Lama(Electrical Repair)',
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
