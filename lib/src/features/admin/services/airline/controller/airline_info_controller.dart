import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/airline_info_model.dart';

class AirlineController {
  final CollectionReference airlines =
  FirebaseFirestore.instance.collection('airlines');

  Future<void> addAirline(String airline,
      String address,
      String airplaneModel,
      String imgUrl,
      String facilities,
      List<String> routes,
      bool refundable,
      bool insurance) async {
    try {
      String id = _generateRandomId();
      await airlines.doc(id).set(
        Airline(
          id: id,
          airline: airline,
          address: address,
          airplaneModel: airplaneModel,
          facilities: facilities,
          imgUrl: imgUrl,
          routes: routes,
          refundable: refundable,
          insurance: insurance,
        ).toMap(),
      );
    } catch (e) {
      print("Error adding airline: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }
}


Future<void> updateAirline(String id,
    String airline,
    String address,
    String airplaneModel,
    String imgUrl,
    String facilities,
    List<String> routes,
    bool refundable,
    bool insurance) async {
  try {
    await AirlineController().airlines.doc(id).update(
      Airline(
         id: id,
        airline: airline,
        address: address,
        airplaneModel: airplaneModel,
        facilities: facilities,
        imgUrl: imgUrl,
        routes: routes,
        refundable: refundable,
        insurance: insurance,
      ).toMap(),
    );
  } catch (e) {
    print("Error updating flight: $e");
  }
}
