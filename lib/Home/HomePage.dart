import 'package:flutter/material.dart';
import 'package:profix_new/Carpenter/CarpenterPage.dart';
import 'package:profix_new/Catering/CateringPage.dart';
import 'package:profix_new/Cleaner/CleanerPage.dart';
import 'package:profix_new/Electrician/ElectricianPage.dart';
import 'package:profix_new/EventPlanner/EventPlannerPage.dart';
import 'package:profix_new/Gardener/GardenerPage.dart';
import 'package:profix_new/Home/NotificationPage.dart';
import 'package:profix_new/Home/ProfilePage.dart';
import 'package:profix_new/Home/SeeAllPage.dart';
import 'package:profix_new/Home/SeeAllPage1.dart';
import 'package:profix_new/Home/SeeAllPage2.dart';
import 'package:profix_new/Home/ThreeLine/About.dart';
import 'package:profix_new/Home/ThreeLine/Logout.dart';
import 'package:profix_new/Home/ThreeLine/PrivacyPolicy.dart';
import 'package:profix_new/Home/ThreeLine/TermsOfUse.dart';
import 'package:profix_new/Home/ThreeLine/contactUs.dart';
import 'package:profix_new/Home/ViewRecommendationPage.dart';
import 'package:profix_new/Painter/PainterPage.dart';
import 'package:profix_new/Photographer/PhotographerPage.dart';
import 'package:profix_new/Plumber/PlumberPage.dart';

class HomePage extends StatelessWidget {
  final String username; // Add this parameter to receive the username
  const HomePage({super.key, this.username = "Guest"}); // Require username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF7FF),
        title: const Text('Home Page'),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
            icon: const Icon(Icons.notifications_none),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 145, 197, 240),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    username, // Display the username here
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()));
              },
            ),
            ListTile(
              title: const Text(
                'Terms of Use',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsOfUsePage()));
              },
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogoutPage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for services',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewRecommendationPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 84, 150, 205),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      'View Recommendations',
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SeeAllPage(
                                      categories: [],
                                    )));
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            builder: (context) => const PlumberPage()));
                  }),
                  _buildRoundCategoryCard(
                      'Electrician', Icons.electrical_services, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ElectricianPage()));
                  }),
                ],
              ),
              const SizedBox(height: 25),
              const Text('Household Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Seeallpage1()));
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  _buildSquareCategoryCard('Gardener', Icons.grass, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GardenerPage(),
                        ));
                  }),
                  _buildSquareCategoryCard('Painter', Icons.format_paint, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PainterPage(),
                        ));
                  }),
                  _buildSquareCategoryCard('Carpenter', Icons.handyman, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CarpenterPage(),
                        ));
                  }),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Event Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Seeallpage2(),
                          ));
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: <Widget>[
                  _buildSquareCategoryCard('Catering', Icons.restaurant, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CateringPage(),
                        ));
                  }),
                  _buildSquareCategoryCard('Event Planner', Icons.event, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventPlannerPage(),
                        ));
                  }),
                  _buildSquareCategoryCard('Photographer', Icons.camera, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhotographerPage(),
                        ));
                  }),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            print("BottomNavigationBar tapped, index: $index");
            if (index == 2) {
              print("Navigating to ProfilePage"); // Debug print
              // Navigate to ProfilePage when the "Profile" icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
            // Add any additional navigation or state change logic for other tabs if needed
          }),
    );
  }
}

// Update your existing category card methods
Widget _buildRoundCategoryCard(
    String title, IconData icon, VoidCallback onTap) {
  return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color.fromARGB(255, 213, 237, 249),
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ));
}

Widget _buildSquareCategoryCard(
    String title, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        Container(
          width: 85,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 213, 237, 249),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17), // Make corners rounded
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

Widget _buildServiceRow(String title, String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: <Widget>[
        Image.asset(imagePath, width: 80, height: 80),
        const SizedBox(width: 16),
        Text(title, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
