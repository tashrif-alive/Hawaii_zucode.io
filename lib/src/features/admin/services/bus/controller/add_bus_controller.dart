import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/add_bus model.dart';


class BusController {
  final CollectionReference buses =
  FirebaseFirestore.instance.collection('buses');

  Future<void> addBus(
      String busCompany,
      String date,
      String departureTime,
      String arrivalTime,
      String duration,
      String sourceLocation,
      String routeDestination,
      String destinationLocation,
      String type,
      ) async {
    try {
      String id = _generateRandomId();
      await buses.doc(id).set(
        Bus(
          id: id,
          busCompany: busCompany,
          date: date,
          departureTime: departureTime,
          arrivalTime: arrivalTime,
          duration: duration,
          sourceLocation: sourceLocation,
          routeDestination: routeDestination,
          destinationLocation: destinationLocation,
          type: type,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding bus: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
