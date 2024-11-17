import 'package:flutter/material.dart';
import 'package:profix_new/GardenerProfiles/RabinPlanting.dart';
import 'package:profix_new/GardenerProfiles/SabiPlanting.dart';
import 'package:profix_new/GardenerProfiles/SaboPlanting.dart';

class PlantingPage extends StatelessWidget {
  const PlantingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planting Services'),
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
                    image: AssetImage('assets/Planting.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Planting services include the selection, placement, and care of plants, ensuring your garden thrives with healthy, beautiful greenery.',
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
                service: 'Plant Selection',
                description:
                    'Helping you choose the best plants for your garden based on soil, climate, and aesthetics.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Soil Preparation',
                description:
                    'Preparing the soil to ensure optimal growth conditions for your plants.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Planting',
                description:
                    'Proper planting techniques to ensure plants thrive.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Mulching',
                description:
                    'Applying mulch to retain moisture and reduce weeds.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Watering and Fertilization',
                description:
                    'Ensuring plants receive the right amount of water and nutrients.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Planting Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Rabin Shahi',
                experience: '8 years of experience',
                rating: 4.8,
                imagePath: 'assets/RabinPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RabinPlanting(
                                name: 'Rabin Shahi',
                                experience:
                                    '8 years of experience in planting services.',
                                rating: 4.8,
                                bio:
                                    'Rabin Shahi is a dedicated planting expert with 8 years of experience. He is passionate about nurturing plants and transforming spaces with beautiful greenery.',
                                services: [
                                  'Planting and Landscaping',
                                  'Garden Maintenance',
                                  'Tree Planting',
                                  'Soil Preparation',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sunita Khadka',
                                    'reviewText':
                                        'Rabin transformed my garden beautifully. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Ram Thapa',
                                    'reviewText':
                                        'Rabin is knowledgeable and very skilled. My garden has never looked better.',
                                  },
                                  {
                                    'reviewerName': 'Maya Shrestha',
                                    'reviewText':
                                        'Excellent service by Rabin. He is professional and reliable.',
                                  },
                                ],
                                imagePath:
                                    'assets/RabinPlanting.PNG', // Specify the correct path to the image asset
                                providerId: 'Rabin Shahi(Planting)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabo Shrestha',
                experience: '5 years of experience',
                rating: 4.7,
                imagePath: 'assets/SaboPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaboPlanting(
                                name: 'Sabo Shrestha',
                                experience:
                                    '5 years of experience in planting.',
                                rating: 4.7,
                                bio:
                                    'Sabo Shrestha has been providing excellent planting services for the past 5 years. Known for his attention to detail and dedication, he ensures that every plant is placed perfectly for optimal growth.',
                                services: [
                                  'Garden Design',
                                  'Planting Trees and Shrubs',
                                  'Flower Bed Installation',
                                  'Landscape Maintenance',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Ravi Sharma',
                                    'reviewText':
                                        'Sabo did an amazing job with our garden. Highly recommend his planting services!',
                                  },
                                  {
                                    'reviewerName': 'Nisha Gupta',
                                    'reviewText':
                                        'Very pleased with the work done by Sabo. He transformed our garden beautifully.',
                                  },
                                  {
                                    'reviewerName': 'Manish Kumar',
                                    'reviewText':
                                        'Sabo is very skilled in planting and landscaping. We are extremely satisfied with his work.',
                                  },
                                ],
                                imagePath: 'assets/SaboPlanting.PNG',
                                providerId: 'Sabo Shrestha(Planting)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sabi Shah',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/SabiPlanting.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SabiPlanting(
                                name: 'Sabi Shah',
                                experience:
                                    '10 years of experience in planting services.',
                                rating: 4.9,
                                bio:
                                    'Sabi Shah is a seasoned expert with 10 years of experience in planting and garden care. Known for delivering exceptional results, Sabi ensures every garden thrives under her meticulous care.',
                                services: [
                                  'Garden Planning and Design',
                                  'Vegetable and Flower Planting',
                                  'Tree and Shrub Installation',
                                  'Soil Testing and Preparation',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Maya Gurung',
                                    'reviewText':
                                        'Sabi transformed our garden into a vibrant space. Her knowledge of plants is outstanding.',
                                  },
                                  {
                                    'reviewerName': 'Rajesh Khadka',
                                    'reviewText':
                                        'Sabi’s work is impeccable. She took the time to understand our needs and delivered beautifully.',
                                  },
                                  {
                                    'reviewerName': 'Rita Lama',
                                    'reviewText':
                                        'Highly recommend Sabi for any planting services. Her experience really shows in her work.',
                                  },
                                ],
                                imagePath: 'assets/SabiPlanting.PNG',
                                providerId: 'Sabi Shah(Planting)',
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
