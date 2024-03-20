import 'package:flutter/material.dart';

class DriverDetailScreen extends StatelessWidget {
  final Map<String, dynamic> driverData;

  DriverDetailScreen({required this.driverData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${driverData['name']}',
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Phone Number: ${driverData['phoneNumber']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Car Model: ${driverData['carModel']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Car Plate Number: ${driverData['carPlateNumber']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Car Color: ${driverData['carColor']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Car Type: ${driverData['carType']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'National ID: ${driverData['nid']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Driving License: ${driverData['drivingLicense']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Availability: ${driverData['available'] ? 'Available' : 'Not Available'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
