import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/BookNow.dart';

class CleanerProfilePage extends StatefulWidget {
  final String providerId;

  const CleanerProfilePage({Key? key, required this.providerId})
      : super(key: key);

  @override
  _CleanerProfilePageState createState() => _CleanerProfilePageState();
}

class _CleanerProfilePageState extends State<CleanerProfilePage> {
  Map<String, dynamic>? cleanerData;
  bool isLoading = true;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCleanerData();
  }

  Future<void> fetchCleanerData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .get();

      if (doc.exists) {
        setState(() {
          cleanerData = doc.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          cleanerData = null;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> incrementLikes() async {
    try {
      await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .update({'likes': FieldValue.increment(1)});

      setState(() {
        cleanerData?['likes'] = (cleanerData?['likes'] ?? 0) + 1;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Thank you for liking!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to like profile: $e")),
      );
    }
  }

  Future<void> submitReview() async {
    final reviewText = _reviewController.text.trim();

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write a review!")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('Service Providers')
          .doc(widget.providerId)
          .collection('Reviews')
          .add({
        'reviewText': reviewText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _reviewController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Review submitted successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to submit review: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (cleanerData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Not Found"),
          backgroundColor: const Color(0xFFCDE8E5),
        ),
        body: const Center(
          child: Text("The requested profile does not exist."),
        ),
      );
    }

    final name = cleanerData?['name'] ?? 'Unknown';
    final experience = cleanerData?['years_of_experience'] ?? 0;
    final likes = cleanerData?['likes'] ?? 0;
    final profileImage = cleanerData?['profileImage'] ?? '';
    final services = cleanerData?['services'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("$name's Profile"),
        backgroundColor: const Color(0xFFCDE8E5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Profile Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFCDE8E5), Color(0xFFEEF7FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: profileImage.isNotEmpty
                            ? NetworkImage(profileImage)
                            : const AssetImage('assets/default_profile.jpg')
                                as ImageProvider,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF4A4B4B),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$experience years of experience",
                        style: const TextStyle(
                          color: Color(0xFF7AA5A0),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up,
                                color: Color(0xFF7AA5A0)),
                            onPressed: incrementLikes,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "$likes likes",
                            style: const TextStyle(
                              color: Color(0xFF7AA5A0),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // About Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A4B4B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            cleanerData?['bio'] ??
                                "No bio available for this provider.",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 78, 78, 78),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Services Offered Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Services Offered",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A4B4B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...services.map(
                            (service) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Color(0xFF7AA5A0)),
                                  const SizedBox(width: 10),
                                  Text(
                                    service,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Add Review Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Add a Review",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4A4B4B),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _reviewController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: "Write your review...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: submitReview,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7AA5A0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Book Service Button
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the Book Service page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookServicePage(
                                providerId: widget.providerId,
                                providerName: name,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7AA5A0),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//BOOKING PAGE KO LAGI
// class BookServicePage extends StatefulWidget {
//   final String providerId;
//   final String providerName;

//   const BookServicePage({
//     Key? key,
//     required this.providerId,
//     required this.providerName,
//   }) : super(key: key);

//   @override
//   State<BookServicePage> createState() => _BookServicePageState();
// }

// class _BookServicePageState extends State<BookServicePage> {
//   final TextEditingController _detailsController = TextEditingController();
//   DateTime? _selectedDate;
//   String selectedTimeSlot = 'Morning'; // Default timeslot

//   Future<void> _confirmBooking() async {
//     if (_selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a date!')),
//       );
//       return;
//     }

//     if (_detailsController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please add additional details!')),
//       );
//       return;
//     }

//     try {
//       User? user = FirebaseAuth.instance.currentUser;

//       if (user == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('You need to log in to book a service!')),
//         );
//         return;
//       }

//       String userId = user.uid;
//       String userName = user.displayName ?? user.email ?? 'Unknown User';

//       await FirebaseFirestore.instance.collection('Bookings').add({
//         'providerId': widget.providerId,
//         'providerName': widget.providerName,
//         'userId': userId,
//         'userName': userName,
//         'serviceName': 'General Cleaning', // Example static service name
//         'status': 'Pending',
//         'date': _selectedDate,
//         'timeSlot': selectedTimeSlot,
//         'additionalDetails': _detailsController.text,
//         'timestamp': Timestamp.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Booking successful!')),
//       );

//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error confirming booking: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book ${widget.providerName}'),
//         backgroundColor: const Color(0xFF7AA5A0),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.providerName,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF4A4B4B),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Service: General Cleaning', // Example static service name
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Select a Date:',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             const SizedBox(height: 10),
//             InkWell(
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add(const Duration(days: 30)),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDate = pickedDate;
//                   });
//                 }
//               },
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade400),
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey.shade100,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       _selectedDate == null
//                           ? 'Choose a Date'
//                           : '${_selectedDate!.toLocal()}'.split(' ')[0],
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                     const Icon(Icons.calendar_today, color: Color(0xFF7AA5A0)),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Preferred Time Slot:',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             const SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: selectedTimeSlot,
//               items: ['Morning', 'Afternoon', 'Evening']
//                   .map((slot) => DropdownMenuItem(
//                         value: slot,
//                         child: Text(slot),
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedTimeSlot = value!;
//                 });
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Additional Details:',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _detailsController,
//               maxLines: 4,
//               decoration: InputDecoration(
//                 hintText: 'Provide any specific requirements...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//               ),
//             ),
//             const SizedBox(height: 30),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _confirmBooking,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF7AA5A0),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Confirm Booking',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
