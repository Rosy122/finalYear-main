import 'package:flutter/material.dart';

class BuffetCateringPage extends StatelessWidget {
  const BuffetCateringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buffet Catering Service'),
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
                        'assets/Buffet.PNG'), // Add your buffet catering image path here
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Buffet catering services provide an all-you-can-eat buffet for events, offering a wide variety of dishes to suit every taste.',
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
                service: 'Wide Variety of Dishes',
                description: 'A selection of appetizers, mains, and desserts.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Customizable Menus',
                description: 'Menu options tailored to your preferences.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Professional Staff',
                description: 'Trained staff for serving and assisting guests.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'High-Quality Ingredients',
                description: 'Fresh and premium-quality food items.',
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Top Caterers for Buffet Catering',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              // ProfessionalProfileTile(
              //   name: 'Anil Joshi',
              //   experience: '15 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/Anil.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const AnilJoshiCateringService(
              //                   name: 'Anil Joshi',
              //                   experience:
              //                       '15 years of experience in catering services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Anil Joshi is an experienced and renowned caterer with over 15 years of providing excellent catering services for various events.',
              //                   services: [
              //                     'Buffet Catering (Rs. 3000/hr)',
              //                     'Plated Meals (Rs. 2500/hr)',
              //                     'Tea and Coffee Service (Rs. 1500/hr)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Priya Sharma',
              //                       'reviewText':
              //                           'Anil provided excellent catering for our event. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Ravi Kumar',
              //                       'reviewText':
              //                           'Great food, great service. Anil made our event special!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sita Rai',
              //                       'reviewText':
              //                           'The buffet catering was top-notch. Everyone loved the food!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Anil.PNG',
              //                   providerId: 'Anil Joshi(Catering)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sita Rani',
              //   experience: '10 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/Sita.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SitaRaniCateringService(
              //                   name: 'Sita Rani',
              //                   experience:
              //                       '10 years of experience in catering services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Sita Rani is a professional caterer with 10 years of experience providing a variety of catering services for events.',
              //                   services: [
              //                     'Buffet Catering (Rs. 3000/hr)',
              //                     'Plated Meals (Rs. 2500/hr)',
              //                     'Tea and Coffee Service (Rs. 1500/hr)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Ravi Kumar',
              //                       'reviewText':
              //                           'Sita Rani did an excellent job catering for our wedding!',
              //                     },
              //                     {
              //                       'reviewerName': 'Priya Sharma',
              //                       'reviewText':
              //                           'Highly recommend her services. Everything was perfect!',
              //                     },
              //                     {
              //                       'reviewerName': 'Anil Joshi',
              //                       'reviewText':
              //                           'Amazing food and excellent service. Thank you, Sita!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Sita.PNG',
              //                   providerId: 'Sita Rani(Catering)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Karan Verma',
              //   experience: '12 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/Karan.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const KaranVermaCateringService(
              //                   name: 'Karan Verma',
              //                   experience:
              //                       '12 years of experience in catering services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Karan Verma is a highly experienced caterer providing premium catering services for various events for over 12 years.',
              //                   services: [
              //                     'Buffet Catering (Rs. 3000/hr)',
              //                     'Plated Meals (Rs. 2500/hr)',
              //                     'Tea and Coffee Service (Rs. 1500/hr)',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Sita Rani',
              //                       'reviewText':
              //                           'Karan’s catering services are impeccable. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Anil Joshi',
              //                       'reviewText':
              //                           'Perfect for large events. Great food and service!',
              //                     },
              //                     {
              //                       'reviewerName': 'Ravi Kumar',
              //                       'reviewText':
              //                           'We had a great experience with Karan. Will definitely hire again.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/Karan.PNG',
              //                   providerId: 'Karan Verma(Catering)',
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
