import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServiceRequestsPage extends StatelessWidget {
  final String providerId;

  ServiceRequestsPage({Key? key, required this.providerId}) : super(key: key) {
    print('Provider ID in ServiceRequestsPage: $providerId');
  }

  Stream<QuerySnapshot> getServiceRequests() {
    // final providerId = FirebaseAuth.instance.currentUser!.uid;
    // print('Fetching requests for providerId: $providerId');
    return FirebaseFirestore.instance
        .collection('Bookings')
        .where('providerId', isEqualTo: providerId)
        .snapshots();
  }

  // Function to update the status of a service request
  void _updateRequestStatus(
      String requestId, String newStatus, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('Bookings')
          .doc(requestId)
          .update({'status': newStatus});

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Request marked as $newStatus successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating request status: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Service Requests',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 192, 236, 231),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: getServiceRequests(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                print('Error fetching requests: ${snapshot.error}');
                return const Center(
                  child: Text('Error fetching service requests.'),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                print(
                    'No matching service requests found for providerId: $providerId');
                return const Center(
                  child: Text('No service requests found.'),
                );
              }

              final requests = snapshot.data!.docs;
              print('Fetched Requests: $requests');

              return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    final requestData = request.data() as Map<String, dynamic>;

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Add padding around the card content
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Request from ${requestData['userName']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Service: ${requestData['serviceName']}'),
                            Text('Time Slot: ${requestData['timeSlot']}'),
                            Text(
                              'Date: ${requestData['date']?.toDate()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Details: ${requestData['additionalDetails']}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _updateRequestStatus(
                                        request.id, 'Accepted', context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                  ),
                                  child: const Text('Accept'),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    _updateRequestStatus(
                                        request.id, 'Rejected', context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                  ),
                                  child: const Text('Reject'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
