import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewRequestsPage extends StatefulWidget {
  const ViewRequestsPage({Key? key}) : super(key: key);

  @override
  State<ViewRequestsPage> createState() => _ViewRequestsPageState();
}

class _ViewRequestsPageState extends State<ViewRequestsPage> {
  String? providerId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProviderId();
  }

  Future<void> fetchProviderId() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          providerId = user.uid; // Fetch the logged-in provider ID
          isLoading = false;
        });
      } else {
        throw Exception("User not logged in.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch provider ID: $e")),
      );
    }
  }

  Stream<QuerySnapshot> _getRequestsStream() {
    if (providerId == null) {
      return const Stream.empty();
    }

    return FirebaseFirestore.instance
        .collection('Bookings')
        .where('providerId',
            isEqualTo: providerId) // Filter requests for this provider
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> _updateRequestStatus(String requestId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('Bookings')
          .doc(requestId)
          .update({'status': newStatus});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Request marked as $newStatus!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update request: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Requests"),
        backgroundColor: const Color(0xFF7AA5A0),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : providerId == null
              ? const Center(
                  child: Text(
                    "Provider ID not found. Please log in again.",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: _getRequestsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text(
                          "No requests found.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                    final requests = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: requests.length,
                      itemBuilder: (context, index) {
                        final request = requests[index];
                        final data = request.data() as Map<String, dynamic>;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Service: ${data['serviceName'] ?? 'N/A'}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "User: ${data['userName'] ?? 'Unknown'}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                Text(
                                  "Date: ${data['date']?.toDate()?.toString().split(' ')[0] ?? 'N/A'}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                Text(
                                  "Time Slot: ${data['timeSlot'] ?? 'N/A'}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                Text(
                                  "Status: ${data['status']}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: data['status'] == 'Pending'
                                        ? Colors.orange
                                        : data['status'] == 'Accepted'
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                ),
                                Text(
                                  "Details: ${data['additionalDetails'] ?? 'No details provided'}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                if (data['status'] == 'Pending') ...[
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                        ),
                                        onPressed: () => _updateRequestStatus(
                                            request.id, 'Accepted'),
                                        child: const Text(
                                          "Accept",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                        ),
                                        onPressed: () => _updateRequestStatus(
                                            request.id, 'Rejected'),
                                        child: const Text(
                                          "Reject",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
