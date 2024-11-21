import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String loggedInUserName;

  const NotificationPage({super.key, required this.loggedInUserName});

  @override
  Widget build(BuildContext context) {
    // Display a SnackBar with a notification message after the page loads
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You are logged in as $loggedInUserName',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.notifications,
              size: 80,
              color: Colors.teal,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to the app!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You are logged in as $loggedInUserName',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
