import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final String providerId;

  const NotificationsPage({Key? key, required this.providerId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: const Color(0xFF7AA5A0),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Notifications')
            // .where('providerId',
            //     isEqualTo: providerId) // Filter for the provider
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No notifications yet!"));
          }

          final notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification =
                  notifications[index].data() as Map<String, dynamic>;

              // Safely retrieve fields with null-safety handling
              final userName = notification['userName'] ?? 'Unknown User';
              final serviceName =
                  notification['serviceName'] ?? 'Unknown Service';
              final date = notification['date'] != null
                  ? (notification['date'] as Timestamp).toDate()
                  : null;
              final timeSlot = notification['timeSlot'] ?? 'No Time Slot';
              final status = notification['status'] ?? 'No Status';

              return Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(userName),
                  subtitle: Text(
                    '$serviceName on ${date != null ? date.toString().split(' ')[0] : 'Unknown Date'} ($timeSlot)',
                  ),
                  trailing: Text(
                    status,
                    style: TextStyle(
                      color: status == 'Pending'
                          ? Colors.orange
                          : status == 'Accepted'
                              ? Colors.green
                              : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
