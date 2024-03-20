import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/bus/view/add_buses_screen.dart';
import '../services/rent_a_car/view/add_car_screen.dart';
import '../services/rent_a_car/view/add_driver_details screens.dart';
import 'airline_services.dart';
import 'hotel_services.dart';

class AdminServicesScreen extends StatefulWidget {
  const AdminServicesScreen({Key? key});

  @override
  State<AdminServicesScreen> createState() => _AdminServicesScreenState();
}

class _AdminServicesScreenState extends State<AdminServicesScreen> {
  final List<Map<String, dynamic>> services = [
    {
      "backgroundImage": const AssetImage('assets/icons/category/flight_icon.png'),
      "title": "Flight",
      "screen": const AirLineServices(),
      "color": Colors.black,
    },
    {
      "backgroundImage": const AssetImage('assets/icons/category/hotel_icon.png'),
      "title": "Hotel",
      "screen": const HotelServices(),
      "color": Colors.black,
    },
    {
      "backgroundImage": const AssetImage('assets/icons/category/bus_icon.png'),
      "title": "Bus",
      "screen": AddBusView(),
      "color": Colors.black,
    },
    {
      "backgroundImage": const AssetImage('assets/icons/category/cab_icon.png'),
      "title": "Cars",
      "screen": AddDriverView(),
      "color": Colors.black,
    },
    {
      "backgroundImage": const AssetImage('assets/icons/category/package.png'),
      "title": "Package",
      "screen": AddCarScreen(),
      "color": Colors.black,
    },
    {
      "backgroundImage": const AssetImage('assets/icons/category/App icon-02.png'),
      "title": "E-Visa",
      "screen": const AirLineServices(),
      "color": Colors.black,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Services",
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Services",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 18.0,
                  mainAxisSpacing: 18.0,
                  childAspectRatio: 4/3
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
                        padding: EdgeInsets.all(15),
                        child: Text(
                          services[index]['title'],
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w600,
                            color: services[index]['color'],
                            fontSize: 12, // Adjust text size here
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              const SizedBox(height: 20),
              Text(
                "Companies",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
