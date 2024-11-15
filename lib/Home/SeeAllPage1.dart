import 'package:flutter/material.dart';
import 'package:profix_new/AC%20Repair/AC%20repairPage.dart';
import 'package:profix_new/Carpenter/CarpenterPage.dart';
import 'package:profix_new/Cleaner/CleanerPage.dart';
import 'package:profix_new/Electrician/ElectricianPage.dart';
import 'package:profix_new/Gardener/GardenerPage.dart';
import 'package:profix_new/Painter/PainterPage.dart';
import 'package:profix_new/Plumber/PlumberPage.dart';

class Seeallpage1 extends StatelessWidget {
  const Seeallpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 219, 236),
        appBar: AppBar(
          title: const Text('Household Services'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
                  _buildRoundCategoryCard('Cleaner', Icons.cleaning_services,
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CleanerPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Plumber', Icons.plumbing, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlumberPage(),
                        ));
                  }),
                  _buildRoundCategoryCard(
                      'Electrician', Icons.electrical_services, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ElectricianPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Gardener', Icons.grass, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GardenerPage(),
                        ));
                    // Add your GardenerPage navigation here
                  }),
                  _buildRoundCategoryCard('Painter', Icons.format_paint, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PainterPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('AC Repair', Icons.ac_unit, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ACRepairPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Carpenter', Icons.handyman, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CarpenterPage(),
                        ));
                  }),
                ])));
  }
}

Widget _buildRoundCategoryCard(
    String title, IconData icon, VoidCallback onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 236, 238, 245),
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ));
}
