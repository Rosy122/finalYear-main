// import 'dart:ffi';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/SignIn/SignInPage.dart';
import 'package:profix_new/User/Home/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize App Check
  await FirebaseAppCheck.instance.activate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProHome(),
      routes: {
        '/signin': (context) => SignInPage(),
        '/Home': (context) => HomePage(),
      },
    );
  }
}

class ProHome extends StatefulWidget {
  const ProHome({super.key});

  @override
  State<ProHome> createState() => _ProHomeState();
}

class _ProHomeState extends State<ProHome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignInPage(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            color: const Color.fromARGB(255, 192, 224, 215),
          ),
          // Circle design
          Positioned(
            top: -690,
            right: -140,
            child: Container(
              width: 450,
              height: 1800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 235, 244, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
            ),
          ),
          // Welcome message
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  'assets/VaccumCleaning.png',
                  width: 400,
                  height: 400,
                ),
                Text(
                  'ProFix...',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          // Login and Sign Up buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const SignInPage()));
                //     // Add your login functionality here
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 30, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: Text(
                //     'SignUp',
                //     style: TextStyle(color: Colors.grey[800]),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const SignUpPage()));
                //     // Add your signup functionality here
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromARGB(255, 230, 230, 230),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 30, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: Text(
                //     'Sign Up',
                //     style: TextStyle(color: Colors.grey[800]),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
