import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profix_new/BookingDetailsPage.dart';

//BOOKING PAGE KO LAGI
class BookServicePage extends StatefulWidget {
  final String providerId;
  final String providerName;
  final String serviceName;

  const BookServicePage({
    Key? key,
    required this.providerId,
    required this.providerName,
    required this.serviceName,
  }) : super(key: key);

  @override
  State<BookServicePage> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  final TextEditingController _detailsController = TextEditingController();
  DateTime? _selectedDate;
  String selectedTimeSlot = 'Morning'; // Default timeslot

  Future<void> _confirmBooking() async {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date!')),
      );
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('You need to log in to book a service!')),
        );
        return;
      }

      String userId = user.uid;
      String userName = user.displayName ?? user.email ?? 'Unknown User';

      print('Provider ID: ${widget.providerId}');

      // Fetch provider document
      DocumentSnapshot providerDoc = await FirebaseFirestore.instance
          .collection('Service Providers') // Corrected collection name
          .doc(widget.providerId)
          .get();

      if (!providerDoc.exists) {
        throw Exception('Provider document does not exist.');
      }

      // Cast data to Map<String, dynamic>
      final data = providerDoc.data() as Map<String, dynamic>;

      if (!data.containsKey('phoneNumber')) {
        throw Exception('Phone number is missing in the provider document.');
      }

      String providerPhoneNumber = data['phoneNumber'];

      // Save booking
      await FirebaseFirestore.instance.collection('Bookings').add({
        'providerId': widget.providerId,
        'providerName': widget.providerName,
        'providerPhoneNumber': providerPhoneNumber,
        'userId': userId,
        'userName': userName,
        'serviceName': widget.serviceName,
        'status': 'Pending',
        'date': _selectedDate,
        'timeSlot': selectedTimeSlot,
        'additionalDetails': _detailsController.text,
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking successful!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingDetailsPage(
            providerPhoneNumber: providerPhoneNumber,
            providerName: widget.providerName,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error confirming booking: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.providerName}'),
        backgroundColor: const Color(0xFF7AA5A0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.providerName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4B4B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Service: ${widget.serviceName}', // Example static service name
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select a Date:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Choose a Date'
                          : '${_selectedDate!.toLocal()}'.split(' ')[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_today, color: Color(0xFF7AA5A0)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Preferred Time Slot:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedTimeSlot,
              items: ['Morning', 'Afternoon', 'Evening']
                  .map((slot) => DropdownMenuItem(
                        value: slot,
                        child: Text(slot),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTimeSlot = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional Details:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _detailsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Provide any specific requirements...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _confirmBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7AA5A0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
