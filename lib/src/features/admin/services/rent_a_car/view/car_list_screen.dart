import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'diver_details_screen.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cars').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriverDetailScreen(
                        driverData: data,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(data['model'] ?? ''),
                    subtitle: Text(data['plateNumber'] ?? ''),
                    // Add more fields as needed
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
