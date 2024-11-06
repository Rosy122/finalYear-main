import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Submit to Firestore
      await FirebaseFirestore.instance.collection('messages').add({
        'name': _nameController.text,
        'email': _emailController.text,
        'message': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        _isSubmitting = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Message Sent!')));
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Name'),
              TextFormField(
                controller: _nameController,
                validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 16),
              Text('Your Email'),
              TextFormField(
                controller: _emailController,
                validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
              ),
              SizedBox(height: 16),
              Text('Your feedback'),
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'Please enter a feedback' : null,
              ),
              SizedBox(height: 16),
              _isSubmitting
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
