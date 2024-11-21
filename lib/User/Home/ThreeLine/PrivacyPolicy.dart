import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy Policy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Here you will provide details on how user data is collected, stored, and used. '
              'Explain clearly if any third-party services are used and how users can manage their data.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections here
          ],
        ),
      ),
    );
  }
}
