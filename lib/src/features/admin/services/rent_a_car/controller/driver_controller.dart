import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/driver_model.dart';

class DriverController {
  final CollectionReference drivers =
  FirebaseFirestore.instance.collection('drivers');

  // Method to add a new driver to the Firestore database
  Future<void> addDriver(
      String name,
      String phoneNumber,
      int nid,
      String carModel,
      String carPlateNumber,
      String carColor,
      String carType,
      String drivingLicense, // Add driving license field
      ) async {
    try {
      String id = _generateRandomId();
      await drivers.doc(id).set(
        Driver(
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          nid: nid,
          carModel: carModel,
          carPlateNumber: carPlateNumber,
          carColor: carColor,
          carType: carType,
          drivingLicense: drivingLicense,
          available: true, // Set the initial availability status of the driver
        ).toMap(),
      );
    } catch (e) {
      print("Error adding driver: $e");
    }
  }

  // Method to generate a random ID for drivers
  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
