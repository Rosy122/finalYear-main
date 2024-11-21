import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms of Use', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Here you will provide the terms and conditions for using the app. '
              'This might include user obligations, limitations, and legal rights.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections here
          ],
        ),
      ),
    );
  }
}
