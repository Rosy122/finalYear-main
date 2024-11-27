import 'package:flutter/material.dart';
// import 'package:profix_new/User/CarpenterProfiles/AnjanaCustom.dart';
// import 'package:profix_new/User/CarpenterProfiles/ManojCustom.dart';
// import 'package:profix_new/User/CarpenterProfiles/SunisaCustom.dart';

class CustomFurniturePage extends StatelessWidget {
  const CustomFurniturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Furniture Services'),
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
                        'assets/CustomFurniture.PNG'), // Update the image path accordingly
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Our custom furniture services allow you to design unique pieces that fit your style and space perfectly.',
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
                service: 'Custom Design Consultation',
                description:
                    'Work with a designer to create a piece that matches your style and space.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Furniture Build',
                description:
                    'Expert craftsmanship to bring your custom furniture to life.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Material Selection',
                description:
                    'Choose from a variety of woods, finishes, and fabrics.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Delivery and Setup',
                description:
                    'We ensure your furniture is safely delivered and set up in your space.',
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Top Custom Furniture Professionals',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sunisa Bhattarai',
              //   experience: '10 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/Sunisa.PNG',
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const SunisaCustomFurnitureService(
              //           name: 'Sunisa Bhattarai',
              //           experience:
              //               '10 years of experience in custom furniture design and build.',
              //           rating: 4.9,
              //           bio:
              //               'Sunisa Bhattarai is an expert in custom furniture design and build with over 10 years of experience in creating unique, high-quality pieces for homes and businesses.',
              //           services: [
              //             'Custom Design Consultation',
              //             'Furniture Build',
              //             'Material Selection',
              //             'Delivery and Setup',
              //           ],
              //           reviews: [
              //             {
              //               'reviewerName': 'Rohit Shah',
              //               'reviewText':
              //                   'Sunisa did an amazing job designing and building my custom furniture. Highly recommended!'
              //             },
              //             {
              //               'reviewerName': 'Ananya Thapa',
              //               'reviewText':
              //                   'Excellent service and great attention to detail. Very happy with my new furniture.'
              //             },
              //             {
              //               'reviewerName': 'Ravi Rai',
              //               'reviewText':
              //                   'Top-quality craftsmanship and outstanding customer service.'
              //             },
              //           ],
              //           imagePath: 'assets/Sunisa.PNG',
              //           providerId: 'Sunisa Bhattrai(Custom Furniture)',
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Manoj Karki',
              //   experience: '8 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/Manoj.PNG',
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) =>
              //             const ManojKarkiCustomFurnitureService(
              //           name: 'Manoj Karki',
              //           experience:
              //               '8 years of experience in custom furniture design and build.',
              //           rating: 4.8,
              //           bio:
              //               'Manoj Karki is a skilled carpenter with 8 years of experience in designing and building custom furniture, offering unique and high-quality craftsmanship.',
              //           services: [
              //             'Custom Design Consultation',
              //             'Furniture Build',
              //             'Material Selection',
              //             'Delivery and Setup',
              //           ],
              //           reviews: [
              //             {
              //               'reviewerName': 'Rohit Kumar',
              //               'reviewText':
              //                   'Manoj built a custom bookshelf for my home. His craftsmanship is outstanding!'
              //             },
              //             {
              //               'reviewerName': 'Sita Rai',
              //               'reviewText':
              //                   'Amazing service! Manoj helped us design the perfect living room furniture set.'
              //             },
              //             {
              //               'reviewerName': 'Anita Shrestha',
              //               'reviewText':
              //                   'Manoj is highly professional and very reliable. Highly recommend his services.'
              //             },
              //           ],
              //           imagePath: 'assets/Manoj.PNG',
              //           providerId: 'Manoj Kumar(Custom Furniture)',
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Anjana Shrestha',
              //   experience: '6 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/Anjana.PNG',
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const AnjanaCustomFurnitureService(
              //           name: 'Anjana Shrestha',
              //           experience:
              //               '6 years of experience in custom furniture design and build.',
              //           rating: 4.7,
              //           bio:
              //               'Anjana Shrestha is a highly skilled professional in designing and building custom furniture. She has been creating unique, high-quality furniture for homes and businesses for over 6 years.',
              //           services: [
              //             'Custom Design Consultation',
              //             'Furniture Build',
              //             'Material Selection',
              //             'Delivery and Setup',
              //           ],
              //           reviews: [
              //             {
              //               'reviewerName': 'Ramesh Shah',
              //               'reviewText':
              //                   'Anjana is amazing! The furniture she made for my house is both beautiful and functional.',
              //             },
              //             {
              //               'reviewerName': 'Nina Rai',
              //               'reviewText':
              //                   'Great experience! Anjana understood exactly what I wanted and delivered perfectly.',
              //             },
              //             {
              //               'reviewerName': 'Shiva Tamang',
              //               'reviewText':
              //                   'Anjana has great attention to detail. I am very happy with the furniture she designed for me.',
              //             },
              //           ],
              //           imagePath: 'assets/Anjana.PNG',
              //           providerId: 'Anjana Shrestha(Custom Furniture)',
              //         ), // Make sure to create this page
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// The IncludedServiceTile widget
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

// The ProfessionalProfileTile widget
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
