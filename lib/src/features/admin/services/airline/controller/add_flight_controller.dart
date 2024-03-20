import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_flight_model.dart';

class FlightController {
  final CollectionReference flights =
      FirebaseFirestore.instance.collection('flights');

  Future<void> addFlight(
    String airlineName,
    String date,
    String fromTime,
    String toTime,
    String duration,
    String fromPlace,
    String toPlace,
    String planeModel,
    bool refundable,
    bool insurance,
    String baggage,
    String flightClass,
    double regularPrice,
    double ourPrice,
    String imgUrl,
    String stoppage,
    String departureTerminal,
    String departureAirport,
    String arrivalTerminal,
    String arrivalAirport,
  ) async {
    try {
      String id = _generateRandomId();
      await flights.doc(id).set(
            Flight(
              id: id,
              airlineName: airlineName,
              date: date,
              fromTime: fromTime,
              toTime: toTime,
              duration: duration,
              fromPlace: fromPlace,
              toPlace: toPlace,
              planeModel: planeModel,
              refundable: refundable,
              insurance: insurance,
              baggage: baggage,
              flightClass: flightClass,
              regularPrice: regularPrice,
              ourPrice: ourPrice,
              imgUrl: imgUrl,
              stoppage: stoppage,
              arrivalAirport: arrivalAirport,
              arrivalTerminal: arrivalTerminal,
              departureAirport: departureAirport,
              departureTerminal: departureTerminal,
            ).toMap(),
          );
    } catch (e) {
      print("Error adding flight: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }

  Future<void> updateFlight(
    String id,
    // Add 'id' to identify which document to update
    String airlineName,
    String date,
    String fromTime,
    String toTime,
    String duration,
    String fromPlace,
    String toPlace,
    String planeModel,
    bool refundable,
    bool insurance,
    String baggage,
    String flightClass,
    double regularPrice,
    double ourPrice,
    String imgUrl,
    String stoppage,
    String departureTerminal,
    String departureAirport,
    String arrivalTerminal,
    String arrivalAirport,
  ) async {
    try {
      await flights.doc(id).update(
            Flight(
              id: id,
              airlineName: airlineName,
              date: date,
              fromTime: fromTime,
              toTime: toTime,
              duration: duration,
              fromPlace: fromPlace,
              toPlace: toPlace,
              planeModel: planeModel,
              refundable: refundable,
              insurance: insurance,
              baggage: baggage,
              flightClass: flightClass,
              regularPrice: regularPrice,
              ourPrice: ourPrice,
              imgUrl: imgUrl,
              stoppage: stoppage,
              departureAirport: departureAirport,
              departureTerminal: departureTerminal,
              arrivalTerminal: arrivalTerminal,
              arrivalAirport: arrivalAirport,
            ).toMap(),
          );
    } catch (e) {
      print("Error updating flight: $e");
    }
  }
}
