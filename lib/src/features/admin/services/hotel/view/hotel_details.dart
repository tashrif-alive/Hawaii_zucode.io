import 'package:flutter/material.dart';

class HotelDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const HotelDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['hotelName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${data['location']}'),
            Text('Type: ${data['hotelType']}'),
            Text('Cost: ${data['offeredHotelCost']}'),
            Text('ID: ${data['id']}'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
