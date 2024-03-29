import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/add_hotel_info_model.dart';

class HotelInformationController {
  final CollectionReference hotelInformation =
      FirebaseFirestore.instance.collection('hotelInformation');

  Future<void> addHotelInformation(
    String name,
    String location,
    double rating,
    List<String> rooms,
    List<String> facilities,
    List<String> access,
    List<String> roomAmenities,
    List<String> safetySecurity,
    List<String> bathRoom,
    List<String> family,
    List<String> transport,
    List<String> internetServices,
    List<String> sports,
    List<String> servicesAndConveniences,
    List<String> meds,
    List<String> languages,
  ) async {
    try {
      String id = _generateRandomId();
      await hotelInformation.doc(id).set(
            HotelInformation(
              id: id,
              name: name,
              location: location,
              rating: rating,
              rooms: rooms,
              facilities: facilities,
              access: access,
              roomAmenities: roomAmenities,
              safetySecurity: safetySecurity,
              bathRoom: bathRoom,
              family: family,
              transport: transport,
              internetServices: internetServices,
              sports: sports,
              servicesAndConveniences: servicesAndConveniences,
              meds: meds,
              languages: languages,
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
}
