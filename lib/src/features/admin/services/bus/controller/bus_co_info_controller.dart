import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/bus_co_info_model.dart';

class BusCompanyController {
  final CollectionReference busCompanies =
  FirebaseFirestore.instance.collection('busCompanies');

  Future<void> addBusCompany(
      String busCompany,
      String address,
      String departureTime,
      String arrivalTime,
      String duration,
      String sourceLocation,
      String routeDestination,
      String destinationLocation,
      String type,
      List<String> routes,
      ) async {
    try {
      String id = _generateRandomId();
      await busCompanies.doc(id).set(
        BusCompany(
          id: id,
          busCompany: busCompany,
          address: address,
          routes: routes,
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
      print("Error adding bus company: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
