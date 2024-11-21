import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageServicesPage extends StatefulWidget {
  final String serviceType;

  const ManageServicesPage({Key? key, required this.serviceType})
      : super(key: key);

  @override
  _ManageServicesPageState createState() => _ManageServicesPageState();
}

class _ManageServicesPageState extends State<ManageServicesPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late String userId;

  @override
  void initState() {
    super.initState();
    userId = _auth.currentUser!.uid; // Get the logged-in user's UID
  }

  Future<void> _addService() async {
    TextEditingController serviceNameController = TextEditingController();
    TextEditingController servicePriceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Service'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: serviceNameController,
                decoration: const InputDecoration(labelText: 'Service Name'),
              ),
              TextField(
                controller: servicePriceController,
                decoration: const InputDecoration(labelText: 'Service Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final serviceName = serviceNameController.text;
                final servicePrice = servicePriceController.text;

                if (serviceName.isNotEmpty && servicePrice.isNotEmpty) {
                  await _firestore
                      .collection('Service Providers')
                      .doc(userId)
                      .update({
                    'services': FieldValue.arrayUnion([
                      {
                        'name': serviceName,
                        'price': servicePrice,
                      }
                    ]),
                  });
                  Navigator.pop(context);
                  setState(() {}); // Refresh the UI
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteService(Map<String, dynamic> service) async {
    await _firestore.collection('Service Providers').doc(userId).update({
      'services': FieldValue.arrayRemove([service]),
    });
    setState(() {}); // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Services'),
        backgroundColor: const Color(0xFFCDE8E5),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('Service Providers').doc(userId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('An error occurred.'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No services found.'));
          }

          List<dynamic> services = snapshot.data!.get('services') ?? [];

          return Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addService,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 153, 209, 168),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Add New Service'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return ListTile(
                      title: Text(service['name']),
                      subtitle: Text('Price: Rs. ${service['price']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteService(service),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
