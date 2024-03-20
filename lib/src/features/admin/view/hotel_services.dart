import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/hotel/view/hotel_info_form.dart';
import '../services/hotel/view/hotel_list.dart';
import '../services/hotel/view/add_hotel_form.dart';
import '../services/hotel/view/manage_hotel_list.dart';



class HotelServices extends StatefulWidget {
  const HotelServices({Key? key});

  @override
  State<HotelServices> createState() => _HotelServicesState();
}

class _HotelServicesState extends State<HotelServices> {
  final List<Map<String, dynamic>> hotelServices = [
    {
      "image": "assets/icons/logos/flight_add.png",
      "color": Colors.orange,
      "title": "Add Hotel",
      "screen": AddHotelForm()
    },
    {
      "image": "assets/icons/logos/hotel_manage.png",
      "color": Colors.lightGreen,
      "title": "Manage Hotels",
      "screen": const ManageHotelListScreen()
    },
    {
      "image": "assets/icons/logos/flight_requ.png",
      "color": Colors.cyan,
      "title": "Reservations",
      "screen": HotelInformationForm()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Hotel Services",
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
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
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),

              ///HotelServices
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: hotelServices.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(hotelServices[index]['screen']);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      decoration: BoxDecoration(
                        color: hotelServices[index]['color'][50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            hotelServices[index]['image'],
                            width: 70, // Adjust image width here
                            height: 70,
                            fit: BoxFit.cover,// Adjust image height here
                          ),

                          Text(
                            hotelServices[index]['title'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: hotelServices[index]['color'],
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
                  "Available Hotels",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              // AdminSearchBarWidget(hintText: 'Search hotels', onSearch: (String value) {},),
              const HotelListScreen()
            ],
          ),
        ),
      ),
    );
  }
}
