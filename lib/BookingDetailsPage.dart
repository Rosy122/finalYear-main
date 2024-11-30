import 'package:flutter/material.dart';
import 'package:profix_new/User/Home/HomePage.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BookingDetailsPage extends StatelessWidget {
  final String providerPhoneNumber;
  final String providerName;

  const BookingDetailsPage({
    Key? key,
    required this.providerPhoneNumber,
    required this.providerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        backgroundColor: const Color(0xFF7AA5A0), // Muted green for header
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF9F9F9), // Soft background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 30), // Inner padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Picture or Placeholder
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/default_profile.jpg'), // Placeholder image
                      backgroundColor: const Color(0xFFDFE8E1),
                    ),
                    const SizedBox(height: 20),
                    // Service Provider Name
                    Text(
                      providerName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3639), // Darker gray
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      color: Color(0xFFB3C2BF), // Light muted color for divider
                      thickness: 1,
                      height: 30,
                    ),
                    const SizedBox(height: 10),
                    // Phone Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Color(
                              0xFF4A7C59), // Same muted green as the header
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          // onTap: () => _openDialPad(providerPhoneNumber),
                          child: Text(
                            providerPhoneNumber,
                            style: const TextStyle(
                              fontSize: 18,
                              color:
                                  Color(0xFF1A73E8), // Blue for clickable text
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Call Button
                    ElevatedButton.icon(
                      onPressed: () async {
                        const phoneNumber =
                            "21213123123"; // Use `tel:` instead of `tel://`
                        if (await canLaunchUrlString(phoneNumber)) {
                          await launchUrlString(phoneNumber);
                        } else {
                          throw "Could not launch $phoneNumber";
                        }
                      },
                      icon: const Icon(Icons.call, color: Colors.white),
                      label: const Text(
                        'Call Now',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A7C59), // Muted green
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Back to Home Button
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomePage(), // Replace `HomePage` with your actual home page widget
                          ),
                          (Route<dynamic> route) =>
                              false, // Removes all previous routes
                        );
                      },
                      icon: const Icon(Icons.home, color: Colors.white),
                      label: const Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF2C3639), // Darker muted color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
