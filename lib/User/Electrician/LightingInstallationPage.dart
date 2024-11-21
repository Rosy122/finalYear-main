import 'package:flutter/material.dart';
import 'package:profix_new/User/ElectricianProfiles/AshaLightingInstallation.dart';
import 'package:profix_new/User/ElectricianProfiles/BikashLightingInstallation.dart';
import 'package:profix_new/User/ElectricianProfiles/HariLightingInstallation.dart';

class LightingInstallationPage extends StatelessWidget {
  const LightingInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lighting Installation Services'),
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
                    image: AssetImage('assets/LightingInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Lighting installation services ensure that your lighting fixtures are installed safely and efficiently, enhancing the ambiance and functionality of your space.',
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
                service: 'Ceiling Light Installation',
                description:
                    'Installing ceiling lights in various areas like living rooms, kitchens, and bedrooms.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Wall Light Installation',
                description:
                    'Installing wall-mounted lights for ambient or task lighting.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Outdoor Light Installation',
                description:
                    'Setting up outdoor lighting for pathways, gardens, and security purposes.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Chandelier Installation',
                description:
                    'Expert installation of chandeliers, ensuring they are secure and level.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'LED Strip Installation',
                description:
                    'Installing LED strip lights for accent or under-cabinet lighting.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Lighting Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Hari Shrestha',
                experience: '8 years of experience',
                rating: 4.9,
                imagePath: 'assets/HariLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HariLightingInstallation(
                                name: 'Hari Shrestha',
                                experience:
                                    '8 years of experience in lighting installation services.',
                                rating: 4.9,
                                bio:
                                    'Hari Shrestha has 8 years of experience in lighting installation. He is highly regarded for his precision and ability to create efficient and aesthetically pleasing lighting solutions.',
                                services: [
                                  'Indoor Lighting Installation',
                                  'Outdoor Lighting Setup',
                                  'LED Lighting Installation',
                                  'Lighting Maintenance and Repair',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Ram Thapa',
                                    'reviewText':
                                        'Hari did an amazing job with our indoor lighting. He was very professional and attentive to detail.',
                                  },
                                  {
                                    'reviewerName': 'Maya Shrestha',
                                    'reviewText':
                                        'Very satisfied with Hari’s service. The lighting setup was done perfectly and has transformed our living space.',
                                  },
                                  {
                                    'reviewerName': 'Shyam Gurung',
                                    'reviewText':
                                        'Hari is experienced and reliable. The outdoor lighting he installed looks fantastic and works flawlessly.',
                                  },
                                ],
                                imagePath: 'assets/HariLighting.PNG',
                                providerId:
                                    'Hari Shrestha(Lighting Installation)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Asha Khadka',
                experience: '6 years of experience',
                rating: 4.8,
                imagePath: 'assets/AshaLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AshaLightingInstallation(
                                name: 'Asha Khadka',
                                experience:
                                    '6 years of experience in lighting installation services.',
                                rating: 4.8,
                                bio:
                                    'Asha Khadka has been providing lighting installation services for 6 years. She is known for her attention to detail and her ability to deliver excellent lighting solutions.',
                                services: [
                                  'Indoor Lighting Installation',
                                  'Outdoor Lighting Setup',
                                  'LED Lighting Installation',
                                  'Lighting Maintenance and Repair',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sunil Lama',
                                    'reviewText':
                                        'Asha did an excellent job with our new lighting setup. She was professional and very knowledgeable.',
                                  },
                                  {
                                    'reviewerName': 'Nirmala Sharma',
                                    'reviewText':
                                        'We were very happy with Asha’s work. The lighting installation was done perfectly and exactly as we wanted.',
                                  },
                                  {
                                    'reviewerName': 'Kiran Shrestha',
                                    'reviewText':
                                        'Asha is highly skilled and provided great service. The lighting in our office looks fantastic.',
                                  },
                                ],
                                imagePath: 'assets/AshaLighting.PNG',
                                providerId:
                                    'Asha Khadka(Lighting Installation)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Bikash Lama',
                experience: '10 years of experience',
                rating: 4.7,
                imagePath: 'assets/BikashLighting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BikashLightingInstallation(
                                name: 'Bikash Lama',
                                experience:
                                    '10 years of experience in lighting installation services.',
                                rating: 4.7,
                                bio:
                                    'Bikash Lama has been delivering professional lighting installation services for 10 years. His expertise ensures top-notch lighting solutions for both residential and commercial spaces.',
                                services: [
                                  'Indoor Lighting Installation',
                                  'Outdoor Lighting Installation',
                                  'LED Lighting Solutions',
                                  'Lighting System Maintenance',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Ramesh Thapa',
                                    'reviewText':
                                        'Bikash did an outstanding job with our office lighting. Highly professional and efficient.',
                                  },
                                  {
                                    'reviewerName': 'Priya Shrestha',
                                    'reviewText':
                                        'We are extremely satisfied with Bikash’s service. The lighting installation was perfect.',
                                  },
                                  {
                                    'reviewerName': 'Rajesh Lama',
                                    'reviewText':
                                        'Bikash is very skilled and his work is impressive. The lighting in our home looks amazing now.',
                                  },
                                ],
                                imagePath: 'assets/BikashLighting.PNG',
                                providerId:
                                    'Bikash Lama(Lighting Installation)',
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
