import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_hotel_model.dart';

class HotelController {
  final CollectionReference hotels =
      FirebaseFirestore.instance.collection('hotels');

  Future<void> addHotel(
    String hotelName,
    String hotelType,
    String location,
    String imgUrl,
    int regularHotelCost,
    int offeredHotelCost,
    int numberOfRooms,
    double occupancyRate,
    double rating,
  ) async {
    try {
      String id = _generateRandomId();
      await hotels.doc(id).set(
            Hotel(
              id: id,
              hotelName: hotelName,
              hotelType: hotelType,
              location: location,
              imgUrl: imgUrl,
              regularHotelCost: regularHotelCost,
              offeredHotelCost: offeredHotelCost,
              numberOfRooms: numberOfRooms,
              occupancyRate: occupancyRate,
              rating: occupancyRate,
            ).toMap(),
          );
    } catch (e) {
      print("Error adding Hotel: $e");
    }
  }

  String _generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000).toString();
  }

  Future<void> updateHotel(
    String id,
    String hotelName,
    String hotelType,
    String location,
    String imgUrl,
    int regularHotelCost,
    int offeredHotelCost,
    int numberOfRooms,
    double occupancyRate,
    double rating,
  ) async {
    try {
      await hotels.doc(id).update(
            Hotel(
              id: id,
              hotelName: hotelName,
              hotelType: hotelType,
              location: location,
              imgUrl: imgUrl,
              regularHotelCost: regularHotelCost,
              offeredHotelCost: offeredHotelCost,
              numberOfRooms: numberOfRooms,
              occupancyRate: occupancyRate,
              rating: rating,
            ).toMap(),
          );
    } catch (e) {
      print("Error updating Hotel: $e");
    }
  }
}
