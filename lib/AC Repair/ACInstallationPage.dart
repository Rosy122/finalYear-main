import 'package:flutter/material.dart';
import 'package:profix_new/ACRepair%20Profiles/RabinACInstallation.dart';
import 'package:profix_new/ACRepair%20Profiles/RameshACInstallation.dart';
import 'package:profix_new/ACRepair%20Profiles/SimranACInstallation.dart';

class ACInstallationPage extends StatelessWidget {
  const ACInstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Installation Services'),
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
                    image: AssetImage('assets/ACInstallation.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              const Text(
                'AC installation services provide professional assistance in setting up air conditioning systems to ensure optimal cooling and efficiency in your space.',
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
                service: 'Site Inspection',
                description:
                    'Assessing the site to determine the best placement for the AC unit and necessary preparations.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Unit Mounting',
                description:
                    'Securely mounting the AC unit to the wall or window as per requirements.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Electrical Connections',
                description:
                    'Setting up the electrical wiring and connections to ensure the AC unit operates safely.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'Ductwork and Insulation',
                description:
                    'Installing necessary ducts and insulation to ensure optimal airflow and energy efficiency.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'System Testing',
                description:
                    'Testing the AC system to ensure it is functioning properly and efficiently.',
              ),
              const IncludedServiceTile(
                icon: Icons.check,
                service: 'User Training',
                description:
                    'Providing basic training on operating the AC unit and maintenance tips.',
              ),
              const SizedBox(height: 20),
              const Text(
                'Top AC Installation Experts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 122, 165, 160),
                ),
              ),
              ProfessionalProfileTile(
                name: 'Ramesh Thapa',
                experience: '10 years of experience',
                rating: 4.9,
                imagePath: 'assets/RameshACInstallation.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RameshACInstallationPage(),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Simran Sharma',
                experience: '7 years of experience',
                rating: 4.8,
                imagePath: 'assets/SimranACInstallation.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimranACInstallationPage(),
                    ),
                  );
                },
              ),
              ProfessionalProfileTile(
                name: 'Rabin Lama',
                experience: '12 years of experience',
                rating: 4.7,
                imagePath: 'assets/RabinACInstallation.PNG',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RabinACInstallationPage(),
                    ),
                  );
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
