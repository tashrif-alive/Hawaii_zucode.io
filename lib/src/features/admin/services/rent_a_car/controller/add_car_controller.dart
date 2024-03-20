import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_car_model.dart';


class CarController {
  final CollectionReference cars =
  FirebaseFirestore.instance.collection('cars');

  Future<void> addCar(
      String model,
      String plateNumber,
      String color,
      String type,
      int seats,
      bool isAC,
      double costPerKm,
      ) async {
    try {
      String id = _generateRandomId();
      await cars.doc(id).set(
        Car(
          id: id,
          model: model,
          plateNumber: plateNumber,
          color: color,
          type: type,
          seats: seats,
          isAC: isAC,
          costPerKm: costPerKm,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding car: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}
