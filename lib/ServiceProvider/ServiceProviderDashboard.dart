import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/ServiceProvider/S.NotificationPage.dart';
import 'package:profix_new/ServiceProvider/Setting.dart';

class ServiceProviderHomePage extends StatelessWidget {
  final String providerName;
  final String serviceType;

  const ServiceProviderHomePage({
    Key? key,
    required this.providerName,
    required this.serviceType,
  }) : super(key: key);

  Future<Map<String, dynamic>> fetchDashboardData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return {
        'providerName': 'Service Provider',
        'totalBookings': 0,
        'pendingRequests': 0,
        'completedRequests': 0,
      };
    }

    final providerSnapshot = await FirebaseFirestore.instance
        .collection('Service Providers')
        .doc(userId)
        .get();

    final providerName = providerSnapshot.exists
        ? providerSnapshot['name'] as String
        : 'Service Provider';

    final bookingsSnapshot = await FirebaseFirestore.instance
        .collection('Bookings')
        .where('providerId', isEqualTo: userId)
        .get();

    final totalBookings = bookingsSnapshot.docs.length;
    final pendingRequests =
        bookingsSnapshot.docs.where((doc) => doc['status'] == 'Pending').length;
    final completedRequests = bookingsSnapshot.docs
        .where((doc) => doc['status'] == 'Completed')
        .length;

    return {
      'providerName': providerName,
      'totalBookings': totalBookings,
      'pendingRequests': pendingRequests,
      'completedRequests': completedRequests,
    };
  }

  @override
  Widget build(BuildContext context) {
    final providerId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xFF7AA5A0),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              final providerId = FirebaseAuth.instance.currentUser?.uid;

              if (providerId != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationsPage(providerId: providerId),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("No provider ID found. Please log in again."),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchDashboardData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Failed to load data."));
          }

          final data = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Banner
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7AA5A0), Color(0xFF5E8D87)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        // FirebaseAuth.instance.currentUser?.displayName ??
                        data['providerName'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Statistics Overview
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(
                        "Total Bookings",
                        data['totalBookings'].toString(),
                        Icons.assignment,
                        Colors.blue,
                      ),
                      _buildStatCard(
                        "Pending Requests",
                        data['pendingRequests'].toString(),
                        Icons.pending_actions,
                        Colors.orange,
                      ),
                      _buildStatCard(
                        "Completed",
                        data['completedRequests'].toString(),
                        Icons.check_circle,
                        Colors.green,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Quick Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "Quick Actions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAction(
                        context,
                        "View Requests",
                        Icons.list_alt,
                        Colors.purple,
                        () {
                          Navigator.pushNamed(context, 'viewRequests');
                        },
                      ),
                      _buildQuickAction(
                        context,
                        "Profile",
                        Icons.person,
                        Colors.teal,
                        () {
                          // Navigate to Profile page
                        },
                      ),
                      _buildQuickAction(
                        context,
                        "Settings",
                        Icons.settings,
                        Colors.grey,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          ); // Navigate to Settings page
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Recent Activity
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Bookings')
                      .where('providerId',
                          isEqualTo: providerId) // Ensure this field matches
                      .orderBy('timestamp', descending: true)
                      .limit(5) // Limit to the most recent 5 bookings
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "No recent activity.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                    final bookings = snapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        final booking =
                            bookings[index].data() as Map<String, dynamic>;

                        // Safely retrieve fields with default values
                        final serviceName =
                            booking['serviceName'] ?? 'Unknown Service';
                        final date = booking['date'] != null
                            ? (booking['date'] as Timestamp).toDate()
                            : null;
                        final status = booking['status'] ?? 'No Status';

                        return ListTile(
                          leading:
                              const Icon(Icons.assignment, color: Colors.blue),
                          title: Text(
                            "Service: $serviceName",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Date: ${date != null ? date.toString().split(' ')[0] : 'Unknown Date'}\nStatus: $status",
                          ),
                          trailing: Icon(
                            status == 'Pending'
                                ? Icons.access_time
                                : status == 'Completed'
                                    ? Icons.check_circle
                                    : Icons.cancel,
                            color: status == 'Pending'
                                ? Colors.orange
                                : status == 'Completed'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
