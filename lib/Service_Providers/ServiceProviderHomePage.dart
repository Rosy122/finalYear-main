import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/Service_Providers/AccountSettings.dart';
import 'package:profix_new/Service_Providers/ManageService.dart';
import 'package:profix_new/Service_Providers/ServiceRequests.dart';
import 'package:profix_new/User/Home/ThreeLine/Logout.dart';

class ServiceProviderHomePage extends StatelessWidget {
  final String providerName;
  final String serviceType;
  final String providerId; // Added to fetch requests dynamically
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ServiceProviderHomePage({
    Key? key,
    required this.providerName,
    required this.serviceType,
    required this.providerId, // Initialize providerId
  }) : super(key: key);

  Stream<QuerySnapshot> getServiceRequests() {
    return FirebaseFirestore.instance
        .collection('Bookings')
        .where('providerId', isEqualTo: providerId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.currentUser!.uid; // Fetch dynamically
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFEEF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF7FF),
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              // Placeholder for notifications
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications.')),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    providerName, // Display the provider's name dynamically
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Manage Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageServicesPage(
                      serviceType: serviceType,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Service Requests',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceRequestsPage(
                      // providerId: FirebaseAuth.instance.currentUser!.uid,
                      providerId: 'UKD7e4u9r1G0pV3N1Tur',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Account Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountSettingsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogoutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Specialization Section
            Card(
              color: const Color.fromARGB(255, 136, 214, 205),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Specialization",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 13, 15, 15),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      serviceType,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Service Requests Section
            const Text(
              "Service Requests",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A4B4B),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: getServiceRequests(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No service requests yet.'),
                    );
                  }

                  final requests = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      final request = requests[index];
                      final customerName = request['userName'];
                      final serviceName = request['serviceName'];
                      final status = request['status'];

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFFCDE8E5),
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text('Service: $serviceName'),
                          subtitle: Text(
                              'Requested by: $customerName\nStatus: $status'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle navigation to request details
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
