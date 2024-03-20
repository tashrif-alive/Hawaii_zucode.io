import 'package:flutter/material.dart';

class BusDetailScreen extends StatelessWidget {
  final Map<String, dynamic> busData;

  BusDetailScreen({required this.busData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Company: ${busData['busCompany']}',
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${busData['date']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Departure Time: ${busData['departureTime']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Arrival Time: ${busData['arrivalTime']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Duration: ${busData['duration']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Source Location: ${busData['sourceLocation']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Route Destination: ${busData['routeDestination']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Destination Location: ${busData['destinationLocation']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
