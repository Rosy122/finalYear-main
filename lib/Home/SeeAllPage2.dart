import 'package:flutter/material.dart';
import 'package:profix_new/Catering/CateringPage.dart';
import 'package:profix_new/EventPlanner/EventPlannerPage.dart';
import 'package:profix_new/MakeupArtist/MakeUpArtistPage.dart';
import 'package:profix_new/Photographer/PhotographerPage.dart';

class Seeallpage2 extends StatelessWidget {
  const Seeallpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 219, 236),
        appBar: AppBar(
          title: const Text('Event Services'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: 3, // Number of items per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
                  _buildRoundCategoryCard('Catering', Icons.restaurant, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CateringPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Event Planner', Icons.event, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventPlannerPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Photographer', Icons.camera, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhotographerPage(),
                        ));
                  }),
                  _buildRoundCategoryCard('Makeup Artist', Icons.face, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MakeupArtistPage(),
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
