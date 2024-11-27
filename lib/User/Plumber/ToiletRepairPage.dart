import 'package:flutter/material.dart';

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
              // const Text(
              //   'Top Toilet Repair Experts',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 122, 165, 160),
              //   ),
              // ),
              // ProfessionalProfileTile(
              //   name: 'Sanjay Karki',
              //   experience: '10 years of experience',
              //   rating: 4.8,
              //   imagePath: 'assets/SanjayToiletRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SanjayToiletRepair(
              //                   name: 'Sanjay Karki',
              //                   experience:
              //                       '10 years of experience in toilet repair services.',
              //                   rating: 4.8,
              //                   bio:
              //                       'Sanjay Karki has been specializing in toilet repairs for 10 years. His extensive experience and high rating reflect his dedication and expertise in fixing toilet issues efficiently and reliably.',
              //                   services: [
              //                     'Toilet Leak Repair',
              //                     'Clogged Toilet Clearing',
              //                     'Flush Mechanism Repair',
              //                     'Toilet Installation and Replacement',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Rajesh Kumar',
              //                       'reviewText':
              //                           'Sanjay did a fantastic job fixing our toilet. Highly professional and efficient!',
              //                     },
              //                     {
              //                       'reviewerName': 'Mina Rai',
              //                       'reviewText':
              //                           'Very pleased with Sanjay’s service. He resolved the issue quickly and was very friendly.',
              //                     },
              //                     {
              //                       'reviewerName': 'Arjun Sharma',
              //                       'reviewText':
              //                           'Sanjay is an expert in toilet repairs. Our toilet has been working perfectly since he fixed it.',
              //                     },
              //                   ],
              //                   imagePath:
              //                       'assets/SanjayToiletRepair.PNG', // Specify the correct path to the image asset
              //                   providerId: '6Y6ayMCWidHSApFQIUh6',
              //                 )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Pooja Sharma',
              //   experience: '8 years of experience',
              //   rating: 4.7,
              //   imagePath: 'assets/PoojaToiletRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const PoojaToiletRepair(
              //                   name: 'Pooja Sharma',
              //                   experience:
              //                       '8 years of experience in toilet repair services.',
              //                   rating: 4.7,
              //                   bio:
              //                       'Pooja Sharma has 8 years of experience in toilet repairs. Her commitment to providing quality service is reflected in her high rating and positive customer feedback.',
              //                   services: [
              //                     'Toilet Leak Repair',
              //                     'Clogged Toilet Clearing',
              //                     'Flush Mechanism Repair',
              //                     'Toilet Installation and Replacement',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Suresh Singh',
              //                       'reviewText':
              //                           'Pooja was great! She fixed our toilet quickly and was very professional.',
              //                     },
              //                     {
              //                       'reviewerName': 'Kiran Thapa',
              //                       'reviewText':
              //                           'Highly recommend Pooja! She knows her job well and provides excellent service.',
              //                     },
              //                     {
              //                       'reviewerName': 'Rekha Karki',
              //                       'reviewText':
              //                           'Pooja did a fantastic job fixing our toilet. We haven’t had any issues since.',
              //                     },
              //                   ],
              //                   imagePath:
              //                       'assets/PoojaToiletRepair.PNG', // Specify the correct path to the image asset
              //                   providerId: 'kOkzlBIiw2wQbZSArXkd',
              //                 )));
              //     //               name: 'Pooja Sharma',
              //     //               experience: '8 years of experience in toilet repairs.',
              //     //               rating: 4.7,
              //     //               bio:
              //     //                   'Pooja is known for her expertise in toilet repairs, with 8 years of experience handling everything from leaks to complex flush system issues.',
              //     //               services: [
              //     //                 'Seal Replacement',
              //     //                 'Flush System Repair',
              //     //                 'Clog Removal',
              //     //                 'Toilet Installation'
              //     //               ],
              //     //               reviews: [
              //     //                 {
              //     //                   'reviewerName': 'Raju Lama',
              //     //                   'reviewText':
              //     //                       'Pooja was fantastic! She fixed our clogged toilet quickly and efficiently.',
              //     //                 },
              //     //                 {
              //     //                   'reviewerName': 'Anita Gurung',
              //     //                   'reviewText':
              //     //                       'Highly professional and knowledgeable. Our toilet is working like new!',
              //     //                 },
              //     //                 {
              //     //                   'reviewerName': 'Sushil Shrestha',
              //     //                   'reviewText':
              //     //                       'Pooja provided great service and was very thorough in her work.',
              //     //                 },
              //     //               ],
              //     //               imagePath: 'assets/PoojaToiletRepair.PNG',
              //     //             )));
              //   },
              // ),
              // ProfessionalProfileTile(
              //   name: 'Ram Shrestha',
              //   experience: '12 years of experience',
              //   rating: 4.9,
              //   imagePath: 'assets/RamToiletRepair.PNG',
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RamToiletRepair(
              //                   name: 'Ram Shrestha',
              //                   experience:
              //                       '12 years of experience in toilet repair services.',
              //                   rating: 4.9,
              //                   bio:
              //                       'Ram Shrestha has over a decade of experience in toilet repairs. His exceptional skills and dedication to quality service have earned him a stellar reputation and a high customer satisfaction rating.',
              //                   services: [
              //                     'Toilet Leak Repair',
              //                     'Clogged Toilet Clearing',
              //                     'Flush Mechanism Repair',
              //                     'Toilet Installation and Replacement',
              //                   ],
              //                   reviews: [
              //                     {
              //                       'reviewerName': 'Hari Dhakal',
              //                       'reviewText':
              //                           'Ram was fantastic! He resolved our toilet issue quickly and professionally.',
              //                     },
              //                     {
              //                       'reviewerName': 'Sarita Rai',
              //                       'reviewText':
              //                           'I highly recommend Ram for any toilet repairs. He is very skilled and efficient.',
              //                     },
              //                     {
              //                       'reviewerName': 'Keshav Koirala',
              //                       'reviewText':
              //                           'Ram’s work is top-notch. He fixed our toilet problem perfectly, and we haven’t had any issues since.',
              //                     },
              //                   ],
              //                   imagePath:
              //                       'assets/RamToiletRepair.PNG', // Specify the correct path to the image asset
              //                   providerId: '8chDA4ZkbLT727YqdscD',
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
