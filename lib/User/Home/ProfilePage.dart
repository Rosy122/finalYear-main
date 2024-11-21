import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profix_new/SignIn/SignInPage.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserData(); // Reload user data when returning to this page
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
    final result = await showDialog<String?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Your Name"),
          content: TextField(
            onChanged: (value) {
              displayName = value;
            },
            decoration: const InputDecoration(hintText: "Your name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pop(null), // Cancel without returning data
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(displayName); // Pass the name back
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
    return result; // result will hold the displayName or null
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

  void _changePassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
    );
  }

  void _openLanguageRegionSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => openLanguageRegionSettings()),
    );
  }

  void _manageSessions() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SessionManagementPage()),
    );
  }

  Future<void> _deleteAccount() async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Account"),
          content: Text(
              "Are you sure you want to delete your account? This action is irreversible."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      try {
        await user?.delete();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignInPage()),
          (Route<dynamic> route) => false,
        );
        print("Account deleted successfully.");
      } catch (e) {
        print("Failed to delete account: $e");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(
                "Failed to delete account. Please re-authenticate and try again."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
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
              _buildSectionTitle('Account Settings'),
              _buildListTile(Icons.lock, 'Change Password', _changePassword),
              SizedBox(height: 20),
              _buildSectionTitle('Preferences'),
              _buildListTile(Icons.language, 'Language & Region',
                  _openLanguageRegionSettings),
              SizedBox(height: 20),
              _buildSectionTitle('Payment Methods'),
              _buildListTile(
                  Icons.credit_card, 'Saved Cards', _manageSavedCards),
              _buildListTile(
                  Icons.account_balance, 'Bank Account', _manageBankAccount),
              SizedBox(height: 20),
              _buildSectionTitle('Security'),
              _buildListTile(
                  Icons.security, 'Session Management', _manageSessions),
              _buildListTile(Icons.delete, 'Delete Account', _deleteAccount),
              SizedBox(height: 20),
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

  void _changeLanguage() => print("Language & Region tapped");
  void _changeTheme() => print("Theme tapped");
  void _manageSavedCards() => print("Saved Cards tapped");
  void _manageBankAccount() => print("Bank Account tapped");
  void _logSessionManagement() => print("Session Management tapped");
  void _Accountdelete() => print("Delete Account tapped");
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  Future<void> _changePassword() async {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = "New passwords do not match.";
      });
      return;
    }

    try {
      User? user = _auth.currentUser;
      final credential = EmailAuthProvider.credential(
        email: user?.email ?? '',
        password: _currentPasswordController.text,
      );

      await user?.reauthenticateWithCredential(credential);
      await user?.updatePassword(_newPasswordController.text);
      setState(() {
        _errorMessage = "Password changed successfully!";
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error changing password: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Current Password'),
            ),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm New Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text("Update Password"),
            ),
          ],
        ),
      ),
    );
  }
}

// Language & Region Settings Page
class openLanguageRegionSettings extends StatefulWidget {
  @override
  _LanguageRegionSettingsPageState createState() =>
      _LanguageRegionSettingsPageState();
}

class _LanguageRegionSettingsPageState
    extends State<openLanguageRegionSettings> {
  String _selectedLanguage = "English";
  String _selectedRegion = "United States";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language & Region Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("Language"),
              subtitle: Text(_selectedLanguage),
              onTap: () async {
                final language = await _selectOption(["English", "Nepali"]);
                if (language != null) {
                  setState(() {
                    _selectedLanguage = language;
                  });
                }
              },
            ),
            Divider(),
            ListTile(
              title: Text("Region"),
              subtitle: Text(_selectedRegion),
              onTap: () async {
                final region = await _selectOption(["United States", "Nepal"]);
                if (region != null) {
                  setState(() {
                    _selectedRegion = region;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _selectOption(List<String> options) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Option"),
          children: options.map((option) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, option);
              },
              child: Text(option),
            );
          }).toList(),
        );
      },
    );
  }
}

// Session Management Page
class SessionManagementPage extends StatefulWidget {
  @override
  _SessionManagementPageState createState() => _SessionManagementPageState();
}

class _SessionManagementPageState extends State<SessionManagementPage> {
  Future<void> _signOutFromAllSessions() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Session Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Manage your active sessions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signOutFromAllSessions,
              child: Text("Sign out from all sessions"),
            ),
          ],
        ),
      ),
    );
  }
}
