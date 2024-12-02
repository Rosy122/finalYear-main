import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/SignIn/SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isPasswordHidden = true;

  String _selectedRole = "User"; // Default to User
  String _verificationId = '';
  // bool _isVerifyingOTP = false;
  // bool _isSendingOTP = false;
  // bool _isOTPVerified = false;
  List<String> _selectedServices = [];
  String _errorMessage = '';

  final List<String> _services = [
    "Cleaning",
    "Gardening",
    "Plumbing",
    "Electrician",
    "Painting",
    "Carpentry",
    "Catering",
    "Photography",
    "Makeup",
    "Ac Repair",
  ]; // List of service options

  Future<void> _sendOTP(String phoneNumber) async {
    setState(() {
      // _isSendingOTP = true;
      _errorMessage = '';
    });

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+977$phoneNumber', // Nepal's country code
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          setState(() {
            // _isOTPVerified = true;
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            _errorMessage = e.message!;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } finally {
      setState(() {
        // _isSendingOTP = false;
      });
    } // Your send OTP logic here
  }

  Future<void> _verifyOTP(String otp) async {
    setState(() {
      // _isVerifyingOTP = true;
      _errorMessage = '';
    });

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      setState(() {
        // _isOTPVerified = true;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Invalid OTP.";
      });
    } finally {
      setState(() {
        // _isVerifyingOTP = false;
      });
    } // Your verify OTP logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDE8E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCDE8E5),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFFCDE8E5),
            ),
          ),
          Expanded(
              flex: 18,
              child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                      color: const Color(0xFFEEF7FF),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Color(0xFF4A4B4B),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Phone Number Input
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 6,
                                  offset: Offset(3, 3),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                prefixIcon: const Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),

                          if (_verificationId.isNotEmpty)
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 6,
                                        offset: Offset(3, 3),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 6,
                                        offset: Offset(-3, -3),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8), // Spacing between fields
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300, // Shadow color
                                  blurRadius: 6, // Soft shadow
                                  offset:
                                      Offset(3, 3), // Position of the shadow
                                ),
                                BoxShadow(
                                  color: Colors.white, // Light effect for 3D
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller:
                                  _nameController, // Replace with the respective controller
                              decoration: InputDecoration(
                                labelText: 'Full Name', // Update for each field
                                prefixIcon: const Icon(Icons.person),
                                filled: true,
                                fillColor:
                                    Colors.white, // Matches the container color
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide
                                      .none, // Removes the default border
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name.'; // Update error message as needed
                                }
                                return null;
                              },
                            ),
                          ),

                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8), // Spacing between fields
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300, // Shadow color
                                  blurRadius: 6, // Soft shadow
                                  offset:
                                      Offset(3, 3), // Position of the shadow
                                ),
                                BoxShadow(
                                  color: Colors.white, // Light effect for 3D
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email.';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 5),

                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8), // Spacing between fields
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300, // Shadow color
                                  blurRadius: 6, // Soft shadow
                                  offset:
                                      Offset(3, 3), // Position of the shadow
                                ),
                                BoxShadow(
                                  color: Colors.white, // Light effect for 3D
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: _isPasswordHidden,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password.';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 5),

                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8), // Spacing between fields
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300, // Shadow color
                                  blurRadius: 6, // Soft shadow
                                  offset:
                                      Offset(3, 3), // Position of the shadow
                                ),
                                BoxShadow(
                                  color: Colors.white, // Light effect for 3D
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: _isPasswordHidden,
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                prefixIcon: const Icon(Icons.lock),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your Password.';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          //LOCATION KO LAGI
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8), // Spacing between fields
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300, // Shadow color
                                  blurRadius: 6, // Soft shadow
                                  offset:
                                      Offset(3, 3), // Position of the shadow
                                ),
                                BoxShadow(
                                  color: Colors.white, // Light effect for 3D
                                  blurRadius: 6,
                                  offset: Offset(-3, -3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _locationController,
                              decoration: InputDecoration(
                                labelText: 'Location',
                                prefixIcon: const Icon(Icons.location_on),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your location.';
                                }
                                return null;
                              },
                            ),
                          ),

                          const Row(
                            children: [Text('Sign Up As')],
                          ),
                          const SizedBox(height: 5),
                          DropdownButton<String>(
                            value: _selectedRole,
                            items:
                                ['User', 'Service Provider'].map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(role),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRole = newValue!;
                              });
                            },
                            dropdownColor: Colors.white,
                            icon: Icon(
                              Icons.arrow_drop_down, // Custom icon
                              color: Colors.black, // Icon color
                            ),
                            underline: Container(
                              height: 1,
                              color: Colors.grey, // Underline color
                            ),
                            // iconEnabledColor: Colors.white,
                            // iconDisabledColor: Colors.grey,
                          ),
                          const SizedBox(height: 15),
                          if (_selectedRole == "Service Provider") ...[
                            const Row(
                              children: [Text('Services Offered')],
                            ),
                            const SizedBox(height: 5),
                            Wrap(
                              spacing: 8,
                              children: _services.map((service) {
                                return FilterChip(
                                  label: Text(service),
                                  selected: _selectedServices.contains(service),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      if (selected) {
                                        _selectedServices.add(service);
                                      } else {
                                        _selectedServices.remove(service);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 15),
                            const Row(
                                // children: [Text('Years of Experience')],
                                ),
                            const SizedBox(height: 5),
                            // TextField(
                            //   controller: _experienceController,
                            //   keyboardType: TextInputType.number,
                            //   decoration: InputDecoration(
                            //     hintText: 'Enter years of experience',
                            //     filled: true,
                            //     fillColor: Colors.grey[300],
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //       borderSide: BorderSide.none,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8), // Spacing between fields
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300, // Shadow color
                                    blurRadius: 6, // Soft shadow
                                    offset:
                                        Offset(3, 3), // Position of the shadow
                                  ),
                                  BoxShadow(
                                    color: Colors.white, // Light effect for 3D
                                    blurRadius: 6,
                                    offset: Offset(-3, -3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: _experienceController,
                                decoration: InputDecoration(
                                  labelText: 'Years of Experience',
                                  prefixIcon: const Icon(Icons.work),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Experience.';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],

                          const SizedBox(height: 25),
                          if (_errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                _errorMessage,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 14),
                              ),
                            ),
                          Center(
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 122, 165, 160),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ))))
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    setState(() {
      _errorMessage = '';
    });

    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _locationController.text.isEmpty ||
        (_selectedRole == "Service Provider" &&
            (_selectedServices.isEmpty ||
                _experienceController.text.isEmpty))) {
      setState(() {
        _errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Passwords do not match.';
      });
      return;
    }

    try {
      // Create a user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;

//FIREBASE MA LOCATION FIELD ADD GAREKO

        String location = _locationController.text;

        // If role is 'User', add to 'Users' collection
        if (_selectedRole == "User") {
          await FirebaseFirestore.instance.collection('Users').doc(uid).set({
            'name': _nameController.text,
            'email': _emailController.text,
            'location': location,
            'phoneNumber': '+977${_phoneController.text}', // Save phone number
            'role': 'User',
          });
        }
        // If role is 'Service Provider', add to 'Service Providers' collection
        else if (_selectedRole == "Service Provider") {
          String name = _nameController.text;
          int yearsOfExperience = int.parse(_experienceController.text);
          List<String> services = _selectedServices;
          final bio =
              "$name is a highly skilled professional with $yearsOfExperience years of experience in ${services.join(", ")}. Known for quality and dedication, $name ensures every service is performed with excellence.";
          await FirebaseFirestore.instance
              .collection('Service Providers')
              .doc(uid)
              .set({
            'name': _nameController.text,
            'email': _emailController.text,
            'location': location,
            'role': 'Service Provider',
            'services': _selectedServices,
            'service type': _selectedServices.isNotEmpty
                ? _selectedServices
                    .join(", ") // Combine services into a single string
                : "General",
            'phoneNumber': '+977${_phoneController.text}', // Save phone number
            'years_of_experience': int.parse(_experienceController.text),
            'likes': 0, // Default value
            'profileImage': '', // Default profile image URL
            'bio': bio, // Default bio
          });
        }

        // Redirect to Sign-In Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'email-already-in-use') {
          _errorMessage = 'The account already exists for that email.';
        } else if (e.code == 'weak-password') {
          _errorMessage = 'The password provided is too weak.';
        } else if (e.code == 'invalid-email') {
          _errorMessage = 'The email address is not valid.';
        } else {
          _errorMessage = 'An error occurred. Please try again.';
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unknown error occurred. Please try again.';
      });
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 80);
    path.quadraticBezierTo(0, 0, 70, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
