import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bus_details.dart';


class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('buses').snapshots(),
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
                    builder: (context) => BusDetailScreen(
                      busData: data,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(data['busCompany'] ?? ''),
                  subtitle: Text(data['date'] ?? ''),
                  // Add more fields as needed
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
