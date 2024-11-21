import 'package:flutter/material.dart';
import 'package:profix_new/User/Catering/BuffetCatering.dart';
import 'package:profix_new/User/Catering/Platedmeals.dart';
import 'package:profix_new/User/Catering/TeaService.dart';
import 'package:profix_new/User/CateringProfiles/AnilCatering.dart';
import 'package:profix_new/User/CateringProfiles/KaranCatering.dart';
import 'package:profix_new/User/CateringProfiles/SitaCatering.dart';

void main() => runApp(const CateringPageApp());

class CateringPageApp extends StatelessWidget {
  const CateringPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CateringPage(),
    );
  }
}

class CateringPage extends StatelessWidget {
  const CateringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catering Services'),
        backgroundColor: const Color.fromARGB(255, 213, 237, 249),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Available Services',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              SizedBox(height: 10),
              ServiceTile(
                icon: Icons.fastfood,
                service: 'Buffet Catering',
                description: 'All-you-can-eat buffet for events',
                price: 'Rs. 3000/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuffetCateringPage()));
                },
              ),
              ServiceTile(
                icon: Icons.kitchen,
                service: 'Plated Meals',
                description: 'Serve plated meals for formal occasions',
                price: 'Rs. 2500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlatedMealsPage()));
                },
              ),
              ServiceTile(
                icon: Icons.coffee,
                service: 'Tea and Coffee Service',
                description: 'Provide tea and coffee for events',
                price: 'Rs. 1500/hr',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TeaAndCoffeeServicePage()));
                },
              ),
              SizedBox(height: 20),
              Text(
                'Top Caterers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 122, 165, 160)),
              ),
              ProfessionalProfileTile(
                name: 'Anil Joshi',
                experience: '15 years of experience',
                rating: 4.9,
                imagePath: 'assets/Anil.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnilJoshiCateringService(
                                name: 'Anil Joshi',
                                experience:
                                    '15 years of experience in catering services.',
                                rating: 4.9,
                                bio:
                                    'Anil Joshi is an experienced and renowned caterer with over 15 years of providing excellent catering services for various events.',
                                services: [
                                  'Buffet Catering (Rs. 3000/hr)',
                                  'Plated Meals (Rs. 2500/hr)',
                                  'Tea and Coffee Service (Rs. 1500/hr)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Priya Sharma',
                                    'reviewText':
                                        'Anil provided excellent catering for our event. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Ravi Kumar',
                                    'reviewText':
                                        'Great food, great service. Anil made our event special!',
                                  },
                                  {
                                    'reviewerName': 'Sita Rai',
                                    'reviewText':
                                        'The buffet catering was top-notch. Everyone loved the food!',
                                  },
                                ],
                                imagePath: 'assets/Anil.PNG',
                                providerId: 'Anil Joshi(Catering)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Sita Rani',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/Sita.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SitaRaniCateringService(
                                name: 'Sita Rani',
                                experience:
                                    '10 years of experience in catering services.',
                                rating: 4.8,
                                bio:
                                    'Sita Rani is a professional caterer with 10 years of experience providing a variety of catering services for events.',
                                services: [
                                  'Buffet Catering (Rs. 3000/hr)',
                                  'Plated Meals (Rs. 2500/hr)',
                                  'Tea and Coffee Service (Rs. 1500/hr)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Ravi Kumar',
                                    'reviewText':
                                        'Sita Rani did an excellent job catering for our wedding!',
                                  },
                                  {
                                    'reviewerName': 'Priya Sharma',
                                    'reviewText':
                                        'Highly recommend her services. Everything was perfect!',
                                  },
                                  {
                                    'reviewerName': 'Anil Joshi',
                                    'reviewText':
                                        'Amazing food and excellent service. Thank you, Sita!',
                                  },
                                ],
                                imagePath: 'assets/Sita.PNG',
                                providerId: 'Sita Rani(Catering)',
                              )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Karan Verma',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/Karan.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KaranVermaCateringService(
                                name: 'Karan Verma',
                                experience:
                                    '12 years of experience in catering services.',
                                rating: 4.7,
                                bio:
                                    'Karan Verma is a highly experienced caterer providing premium catering services for various events for over 12 years.',
                                services: [
                                  'Buffet Catering (Rs. 3000/hr)',
                                  'Plated Meals (Rs. 2500/hr)',
                                  'Tea and Coffee Service (Rs. 1500/hr)',
                                ],
                                reviews: [
                                  {
                                    'reviewerName': 'Sita Rani',
                                    'reviewText':
                                        'Karan’s catering services are impeccable. Highly recommended!',
                                  },
                                  {
                                    'reviewerName': 'Anil Joshi',
                                    'reviewText':
                                        'Perfect for large events. Great food and service!',
                                  },
                                  {
                                    'reviewerName': 'Ravi Kumar',
                                    'reviewText':
                                        'We had a great experience with Karan. Will definitely hire again.',
                                  },
                                ],
                                imagePath: 'assets/Karan.PNG',
                                providerId: 'Karan Verma(Catering)',
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
