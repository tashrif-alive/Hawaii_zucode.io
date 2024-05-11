import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBookedFlightScreen extends StatelessWidget {
  const UserBookedFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:
          IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed:()=> Get.back()),
          title: Text('My Flights',
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black)),
          centerTitle: true,
          flexibleSpace: Container(),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'Expired',
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
