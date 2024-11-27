import 'package:flutter/material.dart';

class ExteriorPaintingPage extends StatelessWidget {
  const ExteriorPaintingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exterior Painting Services'),
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
                    image: AssetImage('assets/ExteriorPainting.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Exterior painting services protect and beautify your home or building’s exterior, enhancing curb appeal and preventing damage from the elements.',
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
                service: 'Surface Preparation',
                description:
                    'Cleaning, scraping, and sanding surfaces to ensure proper paint adhesion.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Priming',
                description:
                    'Applying primer to surfaces to enhance paint adhesion and durability.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Exterior Wall Painting',
                description:
                    'Painting exterior walls with high-quality, weather-resistant paint.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Trim and Fascia Painting',
                description:
                    'Detail painting of trims, fascias, and other exterior woodwork.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Deck and Fence Painting',
                description:
                    'Painting decks and fences with weather-resistant coatings for protection and aesthetic appeal.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Cleanup',
                description:
                    'Ensuring your property is clean and paint-free after the job is completed.',
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Top Exterior Painting Experts',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              // ProfessionalProfileTile(
              //   name: 'Rasmita Thapa',
              //   experience: '12 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/RasmitaExteriorPainting.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RasmitaPainting(
              //                   name: 'Rasmita Thapa',
              //                   experience:
              //                       '12 years of experience in exterior painting services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Rasmita Thapa is a seasoned exterior painter with 12 years of experience. She specializes in transforming the exteriors of homes and buildings with high-quality, lasting finishes.',
              //                   services: [
              //                     'Exterior Wall Painting',
              //                     'Fence Painting',
              //                     'Deck Staining',
              //                     'Weatherproof Coating',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Ravi Shah',
              //                       'reviewText':
              //                           'Rasmita did a fantastic job on our home’s exterior. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Anjali Rana',
              //                       'reviewText':
              //                           'Very professional and the quality of work was excellent. Our house looks great!',
              //                     },
              //                     {
              //                       'reviewerName': 'Sunil Thapa',
              //                       'reviewText':
              //                           'Rasmita is a true professional. The painting job exceeded our expectations.',
              //                     },
              //                   ],
              //                   imagePath: 'assets/RasmitaExteriorPainting.PNG',
              //                   providerId: 'Rasmita Thapa(Exterior Painting)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sujan Sharma',
              //   experience: '9 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/SujanExteriorPainting.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SujanPainting(
              //                   name: 'Sujan Sharma',
              //                   experience:
              //                       '9 years of experience in exterior painting services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Sujan Sharma is a skilled exterior painter with 9 years of experience. He is known for his attention to detail and quality work that transforms the look of any building.',
              //                   services: [
              //                     'Exterior Wall Painting',
              //                     'Fence Painting',
              //                     'Deck Staining',
              //                     'Weatherproof Coating',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Rita Karki',
              //                       'reviewText':
              //                           'Sujan did an amazing job painting the exterior of our house. Highly recommended!',
              //                     },
              //                     {
              //                       'reviewerName': 'Kiran Shrestha',
              //                       'reviewText':
              //                           'Very professional and the quality of work was top-notch. Sujan is great!',
              //                     },
              //                     {
              //                       'reviewerName': 'Prakash Thapa',
              //                       'reviewText':
              //                           'Sujan is a reliable painter who delivers excellent results. Our house looks fantastic!',
              //                     },
              //                   ],
              //                   imagePath: 'assets/SujanExteriorPainting.PNG',
              //                   providerId: 'Sujan Sharma(Exterior Painting)',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Samarpan Lama',
              //   experience: '15 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/SamarpanExteriorPainting.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SamarpanPainting(
              //                   name: 'Samarpan Lama',
              //                   experience:
              //                       '15 years of experience in exterior painting services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Samarpan Lama is a highly experienced exterior painter with 15 years of expertise. Known for his meticulous work and exceptional quality, he transforms homes and buildings with stunning finishes.',
              //                   services: [
              //                     'Exterior Wall Painting',
              //                     'Deck Staining',
              //                     'Fence Painting',
              //                     'Weatherproof Coating',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Nirjala Rai',
              //                       'reviewText':
              //                           'Samarpan did an outstanding job with our house. The finish is perfect!',
              //                     },
              //                     {
              //                       'reviewerName': 'Ganga Thapa',
              //                       'reviewText':
              //                           'Highly skilled and very professional. Samarpan exceeded our expectations!',
              //                     },
              //                     {
              //                       'reviewerName': 'Kishor Bhattarai',
              //                       'reviewText':
              //                           'Our home looks brand new thanks to Samarpan’s work. Highly recommended!',
              //                     },
              //                   ],
              //                   imagePath:
              //                       'assets/SamarpanExteriorPainting.PNG',
              //                   providerId: 'Samarpan Lama(Exterior Painting)',
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
