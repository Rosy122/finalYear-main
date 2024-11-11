import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _checkAndPromptForDisplayName();
  }

  Future<void> _loadUserData() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (mounted) {
      setState(() {
        user = FirebaseAuth.instance.currentUser; // Refresh user data
      });
    }
  }

  Future<void> _checkAndPromptForDisplayName() async {
    if (user != null &&
        (user!.displayName == null || user!.displayName!.isEmpty)) {
      final displayName = await _promptForDisplayName();
      if (displayName != null && displayName.isNotEmpty) {
        await user!.updateDisplayName(displayName);
        await _loadUserData();
      }
    }
  }

  Future<String?> _promptForDisplayName() async {
    String? displayName;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Your Name"),
          content: TextField(
            onChanged: (value) {
              displayName = value;
            },
            decoration: InputDecoration(hintText: "Your name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(displayName);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
    return displayName;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _uploadProfilePicture();
    }
  }

  Future<void> _uploadProfilePicture() async {
    if (_image == null || user == null) return;

    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures/${user!.uid}.jpg');
      await storageRef.putFile(_image!);
      final downloadURL = await storageRef.getDownloadURL();

      await user!.updatePhotoURL(downloadURL);
      await _loadUserData();
    } catch (e) {
      print("Error uploading profile picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFFEEF7FF),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      backgroundColor: Color(0xFFEEF7FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFD1E7FF),
                          child: ClipOval(
                            child: SizedBox(
                              width: 90,
                              height: 90,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: _image != null
                                    ? Image.file(_image!)
                                    : (user?.photoURL != null
                                        ? Image.network(user!.photoURL!)
                                        : Image.asset(
                                            'assets/Placeholder.png')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      user?.displayName ?? 'User',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@${user?.displayName?.toLowerCase().replaceAll(' ', '') ?? 'username'}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      user?.email ?? 'No Email',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Account Settings Section
              _buildSectionTitle('Account Settings'),
              _buildListTile(Icons.lock, 'Change Password', _changePassword),
              _buildListTile(Icons.phone, 'Two-Factor Authentication',
                  _enableTwoFactorAuth),
              _buildListTile(
                  Icons.account_circle, 'Linked Accounts', _linkAccounts),

              SizedBox(height: 20),

              // Preferences Section
              _buildSectionTitle('Preferences'),
              _buildListTile(Icons.notifications, 'Notification Settings',
                  _openNotificationSettings),
              _buildListTile(
                  Icons.language, 'Language & Region', _changeLanguage),
              _buildListTile(Icons.brightness_6, 'Theme', _changeTheme),

              SizedBox(height: 20),

              // Payment Section
              _buildSectionTitle('Payment Methods'),
              _buildListTile(
                  Icons.credit_card, 'Saved Cards', _manageSavedCards),
              _buildListTile(
                  Icons.account_balance, 'Bank Account', _manageBankAccount),

              SizedBox(height: 20),

              // Security Section
              _buildSectionTitle('Security'),
              _buildListTile(
                  Icons.security, 'Session Management', _manageSessions),
              _buildListTile(Icons.delete, 'Delete Account', _deleteAccount),

              SizedBox(height: 20),

              // Support Section
              _buildSectionTitle('Support'),
              _buildListTile(Icons.help, 'Help Center', _openHelpCenter),
              _buildListTile(Icons.feedback, 'Send Feedback', _sendFeedback),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _changePassword() => print("Change Password tapped");
  void _enableTwoFactorAuth() =>
      print("Enable Two-Factor Authentication tapped");
  void _linkAccounts() => print("Linked Accounts tapped");
  void _openNotificationSettings() => print("Notification Settings tapped");
  void _changeLanguage() => print("Language & Region tapped");
  void _changeTheme() => print("Theme tapped");
  void _manageSavedCards() => print("Saved Cards tapped");
  void _manageBankAccount() => print("Bank Account tapped");
  void _manageSessions() => print("Session Management tapped");
  void _deleteAccount() => print("Delete Account tapped");
  void _openHelpCenter() => print("Help Center tapped");
  void _sendFeedback() => print("Send Feedback tapped");
}
