import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the current service provider's UID
    String? providerId = 'UKD7e4u9r1G0pV3N1Tur';

    print('Provider ID being used: $providerId');

    // Debugging: Log the providerId
    print('Current Provider ID: $providerId');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF7AA5A0),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Force UI rebuild (optional)
              // ignore: invalid_use_of_protected_member
              (context as Element).reassemble();
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Notifications')
            .where('providerId', isEqualTo: providerId)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error fetching notifications: ${snapshot.error}');
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final notifications = snapshot.data?.docs ?? [];

          if (notifications.isEmpty) {
            print('No notifications found for providerId: $providerId');
            return const Center(
              child: Text(
                'No notifications yet!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }

          print('Notifications fetched: ${notifications.length}');
          for (var notification in notifications) {
            print('Notification: ${notification.data()}');
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final message = notification['message'] ?? 'No message';
              final timestamp =
                  notification['timestamp']?.toDate()?.toString() ??
                      'Unknown date';
              final status = notification['status'] ?? 'Unread';

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(message),
                  subtitle: Text(
                    timestamp,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  trailing: status == 'Unread'
                      ? Icon(Icons.notifications_active, color: Colors.red)
                      : Icon(Icons.notifications, color: Colors.grey),
                  onTap: () {
                    _markAsRead(context, notification.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to mark a notification as "Read"
  Future<void> _markAsRead(BuildContext context, String notificationId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Notifications')
          .doc(notificationId)
          .update({'status': 'Read'});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification marked as Read!')),
      );
    } catch (e) {
      print('Error marking notification as read: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to mark notification as Read!')),
      );
    }
  }
}
