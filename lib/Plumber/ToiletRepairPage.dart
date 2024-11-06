import 'package:flutter/material.dart';
import 'package:profix_new/PlumberProfiles/PoojaToiletRepair.dart';
import 'package:profix_new/PlumberProfiles/RamToiletRepair.dart';
import 'package:profix_new/PlumberProfiles/SanjayToiletRepair.dart';
// import 'package:profix/SanjayToiletRepairPage.dart';
// import 'package:profix/PoojaToiletRepairPage.dart';
// import 'package:profix/RamToiletRepairPage.dart';

class ToiletRepairPage extends StatelessWidget {
  const ToiletRepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toilet Repair Services'),
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
                    image: AssetImage('assets/ToiletRepair.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'Toilet repair services address various issues, including leaks, clogs, and malfunctioning flush systems, to ensure your toilet is functioning properly.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Common Repair Services:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              const SizedBox(height: 10),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Leak Repair',
                description:
                    'Fixing leaks from the toilet base or tank to prevent water damage.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Clog Removal',
                description:
                    'Unclogging toilets to restore proper flushing and drainage.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Flush System Repair',
                description:
                    'Repairing or replacing faulty flush systems for optimal operation.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Toilet Installation',
                description:
                    'Installing new toilets or replacing old ones with modern fixtures.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Seal Replacement',
                description:
                    'Replacing worn-out seals to prevent leaks and ensure proper toilet functioning.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top Toilet Repair Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Sanjay Karki',
                experience: '10 years of experience',
                rating: 4.8,
                imagePath: 'assets/SanjayToiletRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SanjayToiletRepairPage()));
                  //               name: 'Sanjay Karki',
                  //               experience: '10 years of experience in toilet repairs.',
                  //               rating: 4.8,
                  //               bio:
                  //                   'With a decade of experience, Sanjay specializes in all aspects of toilet repair, ensuring quick and effective solutions to your plumbing problems.',
                  //               services: [
                  //                 'Leak Repair',
                  //                 'Clog Removal',
                  //                 'Flush System Repair',
                  //                 'Toilet Installation'
                  //               ],
                  //               reviews: [
                  //                 {
                  //                   'reviewerName': 'Gopal Shrestha',
                  //                   'reviewText':
                  //                       'Sanjay did an excellent job fixing our toilet leak. Highly recommended!',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Sita Rana',
                  //                   'reviewText':
                  //                       'Professional and quick. The toilet works perfectly now.',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Manoj Thapa',
                  //                   'reviewText':
                  //                       'Great service and attention to detail. Sanjay is very skilled!',
                  //                 },
                  //               ],
                  //               imagePath: 'assets/SanjayToiletRepair.PNG',
                  //             )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Pooja Sharma',
                experience: '8 years of experience',
                rating: 4.7,
                imagePath: 'assets/PoojaToiletRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PoojaToiletRepairPage()));
                  //               name: 'Pooja Sharma',
                  //               experience: '8 years of experience in toilet repairs.',
                  //               rating: 4.7,
                  //               bio:
                  //                   'Pooja is known for her expertise in toilet repairs, with 8 years of experience handling everything from leaks to complex flush system issues.',
                  //               services: [
                  //                 'Seal Replacement',
                  //                 'Flush System Repair',
                  //                 'Clog Removal',
                  //                 'Toilet Installation'
                  //               ],
                  //               reviews: [
                  //                 {
                  //                   'reviewerName': 'Raju Lama',
                  //                   'reviewText':
                  //                       'Pooja was fantastic! She fixed our clogged toilet quickly and efficiently.',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Anita Gurung',
                  //                   'reviewText':
                  //                       'Highly professional and knowledgeable. Our toilet is working like new!',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Sushil Shrestha',
                  //                   'reviewText':
                  //                       'Pooja provided great service and was very thorough in her work.',
                  //                 },
                  //               ],
                  //               imagePath: 'assets/PoojaToiletRepair.PNG',
                  //             )));
                },
              ),
              ProfessionalProfileTile(
                name: 'Ram Shrestha',
                experience: '12 years of experience',
                rating: 4.9,
                imagePath: 'assets/RamToiletRepair.PNG',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RamToiletRepairPage()));
                  //               name: 'Ram Shrestha',
                  //               experience: '12 years of experience in toilet repairs.',
                  //               rating: 4.9,
                  //               bio:
                  //                   'Ram brings over 12 years of experience to the table, making him an expert in all types of toilet repairs and installations.',
                  //               services: [
                  //                 'Leak Repair',
                  //                 'Toilet Installation',
                  //                 'Flush System Repair',
                  //                 'Clog Removal'
                  //               ],
                  //               reviews: [
                  //                 {
                  //                   'reviewerName': 'Kiran Rai',
                  //                   'reviewText':
                  //                       'Ram was excellent! He fixed our toilet issues quickly and professionally.',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Sarita Basnet',
                  //                   'reviewText':
                  //                       'Very satisfied with Ram\'s work. Our toilet is functioning perfectly now.',
                  //                 },
                  //                 {
                  //                   'reviewerName': 'Sunil Thapa',
                  //                   'reviewText':
                  //                       'Ram is highly skilled and provides great service. Highly recommend!',
                  //                 },
                  //               ],
                  //               imagePath: 'assets/RamToiletRepair.PNG',
                  // )));
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
