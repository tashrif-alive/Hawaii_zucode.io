import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/views/user_trip/user_booked_bus_trip.dart';
import 'package:hawaii_beta/src/features/user/views/user_trip/user_booked_cabs_trip.dart';
import 'package:hawaii_beta/src/features/user/views/user_trip/user_booked_flight_trip.dart';
import 'package:hawaii_beta/src/features/user/views/user_trip/user_booked_hotel_trip.dart';

class UserTripScreen extends StatelessWidget {
  UserTripScreen({Key? key});

  final List<Map<String, dynamic>> services = [
    {
      "title": "Flight",
      "screen": const UserBookedFlightScreen(),
      "backgroundImage": const AssetImage('assets/icons/category/flight_icon.png'),
    },
    {
      "title": "Hotel",
      "screen": const UserBookedHotelScreen(),
      "backgroundImage": const AssetImage('assets/icons/category/hotel_icon.png'),
    },
    {
      "title": "Bus",
      "screen": const UserBookedBusScreen(),
      "backgroundImage": const AssetImage('assets/icons/category/bus_icon.png'),
    },
    {
      "title": "Cabs",
      "screen": const UserBookedCabsScreen(),
      "backgroundImage": const AssetImage('assets/icons/category/cab_icon.png'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'My Trip',
                style: GoogleFonts.ubuntu(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 2,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(services[index]['screen']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: services[index]['backgroundImage'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          services[index]['title'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
