import 'package:flutter/material.dart';

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
      body: const SingleChildScrollView(
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
              ),
              ServiceTile(
                icon: Icons.kitchen,
                service: 'Plated Meals',
                description: 'Serve plated meals for formal occasions',
                price: 'Rs. 2500/hr',
              ),
              ServiceTile(
                icon: Icons.coffee,
                service: 'Tea and Coffee Service',
                description: 'Provide tea and coffee for events',
                price: 'Rs. 1500/hr',
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
              ),
              ProfessionalProfileTile(
                name: 'Sita Rani',
                experience: '10 years of experience',
                rating: 4.8,
              ),
              ProfessionalProfileTile(
                name: 'Karan Verma',
                experience: '12 years of experience',
                rating: 4.7,
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

  const ServiceTile({super.key, 
    required this.icon,
    required this.service,
    required this.description,
    required this.price,
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
      ),
    );
  }
}

class ProfessionalProfileTile extends StatelessWidget {
  final String name;
  final String experience;
  final double rating;
  //final String imagePath;

  const ProfessionalProfileTile({super.key, 
    required this.name,
    required this.experience,
    required this.rating,
    //required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
            //backgroundImage: AssetImage(imagePath),
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
      ),
    );
  }
}
