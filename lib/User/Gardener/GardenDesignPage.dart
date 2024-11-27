import 'package:flutter/material.dart';
// import 'package:profix_new/User/GardenerProfiles/GojoGardenDesign.dart';
// import 'package:profix_new/User/GardenerProfiles/RadhikaGardenDesign.dart';
// import 'package:profix_new/User/GardenerProfiles/SharmilaGardenDesign.dart';

class GardenDesignPage extends StatelessWidget {
  const GardenDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garden Design Services'),
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
                    image: AssetImage('assets/GardenDesign.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Garden design services help you create a beautiful and functional outdoor space tailored to your preferences and the local environment.',
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
                service: 'Landscape Planning',
                description:
                    'Designing a layout that maximizes the beauty and utility of your garden space.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Plant Selection',
                description:
                    'Choosing plants that thrive in your local climate and fit your aesthetic preferences.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Hardscaping',
                description:
                    'Incorporating elements like paths, walls, and patios into the garden design.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Water Features',
                description:
                    'Designing and installing ponds, fountains, and other water features.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Lighting Design',
                description:
                    'Creating a lighting plan that enhances the garden’s beauty and functionality at night.',
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Top Garden Design Experts',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              // ProfessionalProfileTile(
              //   name: 'Radhika Gurung',
              //   experience: '10 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/RadhikaGardenDesign.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RadhikaGardenDesign(
              //                   name: 'Radhika Gurung',
              //                   experience:
              //                       '10 years of experience in garden design services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Radhika Gurung is a skilled garden designer with a decade of experience. She specializes in creating beautiful, sustainable garden spaces that bring nature closer to home.',
              //                   services: [
              //                     'Custom Garden Design',
              //                     'Plant Selection and Installation',
              //                     'Garden Maintenance Plans',
              //                     'Seasonal Planting and Care',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Aarati Singh',
              //                       'reviewText':
              //                           'Radhika transformed our backyard into a beautiful garden. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sanjay Lama',
              //                       'reviewText':
              //                           'Her designs are unique and perfectly suited to our space. We love our new garden!',
              //                     },
              //                     {
              //                       'reviewerName': 'Nisha Thapa',
              //                       'reviewText':
              //                           'Radhika’s work is exceptional. She is professional, creative, and very knowledgeable.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RadhikaGardenDesign.PNG',
              //                   providerId: 'Radhika Gurung(GardenDesign)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sharmila Kumar',
              //   experience: '7 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/SharmilaGardenDesign.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SharmilaGardenDesign(
              //                   name: 'Sharmila Kumar',
              //                   experience:
              //                       '7 years of experience in garden design services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Sharmila Kumar is a passionate garden designer with 7 years of experience. She is known for creating serene and functional garden spaces that reflect her clients’ personalities.',
              //                   services: [
              //                     'Landscape Design',
              //                     'Plant Installation',
              //                     'Garden Renovation',
              //                     'Maintenance Services',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Anita Rai',
              //                       'reviewText':
              //                           'Sharmila did an amazing job with our garden. Her designs are truly unique!',
              //                     },
              //                     {
              //                       'reviewerName': 'Bikash Shrestha',
              //                       'reviewText':
              //                           'Her attention to detail is remarkable. Our garden looks stunning!',
              //                     },
              //                     {
              //                       'reviewerName': 'Priya Giri',
              //                       'reviewText':
              //                           'Sharmila’s work exceeded our expectations. Highly recommended!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/SharmilaGardenDesign.PNG',
              //                   providerId: 'Sharmila Kumar(GardenDesign)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Gojo Lama',
              //   experience: '12 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/GojoGardenDesign.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const GojoGardenDesign(
              //                   name: 'Gojo Lama',
              //                   experience:
              //                       '12 years of experience in garden design services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Gojo Lama is an experienced garden designer with 12 years of expertise. He is known for creating beautiful and sustainable garden spaces.',
              //                   services: [
              //                     'Landscape Architecture',
              //                     'Irrigation System Design',
              //                     'Outdoor Lighting',
              //                     'Garden Maintenance',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Kiran Sharma',
              //                       'reviewText':
              //                           'Gojo did an outstanding job on our garden. Highly skilled and professional!',
              //                     },
              //                     {
              //                       'reviewerName': 'Mina Rai',
              //                       'reviewText':
              //                           'We love our new garden! Gojo’s design and execution were flawless.',
              //                     },
              //                     {
              //                       'reviewerName': 'Sushil Pandey',
              //                       'reviewText':
              //                           'Gojo’s work transformed our outdoor space. Would definitely recommend!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/GojoGardenDesign.PNG',
              //                   providerId: 'Gojo Lama(GardenDesign)',
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
