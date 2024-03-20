import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBookedBusScreen extends StatelessWidget {
  const UserBookedBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bus Bookings",
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
          flexibleSpace: Container(),
          bottom: const TabBar(
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
