import 'package:flutter/material.dart';
import 'package:profix_new/User/ACRepair%20Profiles/PramodACServicing.dart';
import 'package:profix_new/User/ACRepair%20Profiles/PranishaACService.dart';
import 'package:profix_new/User/ACRepair%20Profiles/SamishaACServicing.dart';

class ACServicingPage extends StatelessWidget {
  const ACServicingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Servicing Services'),
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
                    image: AssetImage('assets/ACServicing.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Our AC servicing ensures your system runs efficiently and effectively, extending its lifespan and improving air quality in your space.',
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
                service: 'Filter Cleaning',
                description:
                    'Removing and cleaning filters to ensure better air quality and efficiency.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Coolant Level Check',
                description:
                    'Checking and refilling coolant to maintain cooling effectiveness.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Condenser Coil Cleaning',
                description:
                    'Cleaning coils to prevent overheating and enhance cooling performance.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Thermostat Calibration',
                description:
                    'Ensuring the thermostat reads temperature accurately for better control.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Compressor Health Check',
                description:
                    'Inspecting the compressor to avoid potential breakdowns.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top AC Servicing Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Pranisha Thapa',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/Pranisha.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PranishaACService(
                        name: 'Pranisha Thapa',
                        experience:
                            '10 years of experience in AC repair services.',
                        rating: 4.8,
                        bio:
                            'Pranisha Thapa is a highly skilled AC repair technician with 5 years of experience. Known for her professionalism and expertise in the field.',
                        services: [
                          'AC Installation',
                          'AC Repair',
                          'AC Maintenance',
                          'Air Purification Systems',
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Sita Rai',
                            'reviewText':
                                'Pranisha did an amazing job with my AC repair! Highly recommend her.',
                          },
                          {
                            'reviewerName': 'Ravi Lama',
                            'reviewText':
                                'Excellent service! My AC is working perfectly again.',
                          },
                          {
                            'reviewerName': 'Anjali Shrestha',
                            'reviewText':
                                'Very professional and quick service. Great experience!',
                          },
                        ],
                        imagePath: 'assets/Pranisha.PNG',
                        providerId: 'Pranisha Thapa(AC Service)',
                      ),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Samisha Sharma',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/Samisha.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SamishaACService(
                          name: 'Samisha Sharma',
                          experience: '7 years of experience in AC servicing.',
                          rating: 4.8,
                          bio:
                              'Samisha Sharma is a reliable AC servicing expert with 4 years of experience, dedicated to providing excellent service and customer satisfaction.',
                          services: [
                            'AC Repair',
                            'AC Cleaning',
                            'AC Installation',
                            'AC Maintenance',
                          ],
                          reviews: [
                            {
                              'reviewerName': 'Rita Sharma',
                              'reviewText':
                                  'Samisha did an amazing job. My AC is running like new!',
                            },
                            {
                              'reviewerName': 'Pradeep Bhandari',
                              'reviewText':
                                  'Professional and efficient service. Highly recommended!',
                            },
                            {
                              'reviewerName': 'Anita Rai',
                              'reviewText':
                                  'Great service! Samisha is friendly and knows her stuff.',
                            },
                          ],
                          imagePath: 'assets/Samisha.PNG',
                          providerId: 'Samisha Sharma(Ac Service)',
                        ),
                      ));
                },
              ),
              ProfessionalProfileTile(
                name: 'Pramod Lama',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/Pramod.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PramodACService(
                        name: 'Pramod Lama',
                        experience: '12 years of experience in AC servicing.',
                        rating: 4.7,
                        bio:
                            'Pramod Lama is an experienced AC technician committed to providing quality service and customer satisfaction.',
                        services: [
                          'AC Repair',
                          'AC Cleaning',
                          'AC Installation',
                          'AC Maintenance',
                        ],
                        reviews: [
                          {
                            'reviewerName': 'Sita Sharma',
                            'reviewText':
                                'Pramod provided excellent service! Highly satisfied with the repair.',
                          },
                          {
                            'reviewerName': 'Ravi Bhandari',
                            'reviewText':
                                'Very professional and quick. I recommend his services to everyone!',
                          },
                          {
                            'reviewerName': 'Nisha Rai',
                            'reviewText':
                                'Fantastic experience! Pramod is knowledgeable and very friendly.',
                          },
                        ],
                        imagePath: 'assets/Pramod.PNG',
                        providerId: 'Pramod Lama(Ac Service)',
                      ),
                    ),
                  );
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
