import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'flight_approved_list.dart';
import 'flight_canceled_list.dart';
import 'flight_request.dart';

class FlightCheckScreen extends StatelessWidget {
  const FlightCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Get.back()),
          title: Text('Flight Request',
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
                text: 'Request',
              ),
              Tab(
                text: 'Ongoing',
              ),
              Tab(
                text: 'Cancelled',
              ),
            ],
          ),
        ),
        body:   const TabBarView(
          children: [
            FlightRequestListScreen(),
            FlightApprovedList(),
            FlightCanceledList()
          ],
        ),
      ),
    );
  }
}
