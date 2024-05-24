import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/airline/view/add_flight_form.dart';
import '../services/airline/view/flight_list_screen.dart';
import '../services/airline/view/manage_flight_list.dart';


class AirLineServices extends StatefulWidget {
  const AirLineServices({Key? key});

  @override
  State<AirLineServices> createState() => _AirLineServicesState();
}

class _AirLineServicesState extends State<AirLineServices> {
  final List<Map<String, dynamic>> airlineServices = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Flight",
      "screen": const FlightFormView()
    },
    {
      "image": "assets/icons/logos/manage_flight.png",
      "color": Colors.lightGreen,
      "title": "Manage Flights",
      "screen": const ManageFlightListScreen()
    },
    {
      "image": "assets/icons/logos/flight_requ.png",
      "color": Colors.cyan,
      "title": "Flight Request",
      "screen": (){}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Airline Services",
          style: GoogleFonts.ubuntu(
              fontSize: 17, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
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
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),

              ///AirLineServices
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: airlineServices.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(airlineServices[index]['screen']);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      decoration: BoxDecoration(
                        color: airlineServices[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            airlineServices[index]['image'],
                            width: 70, // Adjust image width here
                            height: 70,
                            fit: BoxFit.cover,// Adjust image height here
                          ),

                          Text(
                            airlineServices[index]['title'],
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w500,
                              color: airlineServices[index]['color'],
                              fontSize: 11, // Adjust text size here
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
              Text(
                "Available Flights ",
                style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              // AdminSearchBarWidget(hintText: 'Search flights', onSearch: (String value) {},),
              const FlightListScreen()
            ],
          ),
        ),
      ),
    );
  }
}
