import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBookedHotelScreen extends StatelessWidget {
  const UserBookedHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:
          IconButton(icon: const Icon(Icons.arrow_back,color: Colors.black,), onPressed:()=> Get.back()),
          title: Text(
            "Hotel Bookings",
            style: GoogleFonts.ubuntu(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Container(),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Past',
              ),
              Tab(
                text: 'Cancelled',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [],
        ),
      ),
    );
  }
}
