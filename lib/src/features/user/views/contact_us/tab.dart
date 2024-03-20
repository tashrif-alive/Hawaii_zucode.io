import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/views/contact_us/pre_booking_qs_hotel.dart';
import 'package:hawaii_beta/src/features/user/views/contact_us/pre_booking_qs_packages.dart';
import 'package:hawaii_beta/src/features/user/views/contact_us/pre_bookings_qs.dart';

class PrebookingTabBar extends StatelessWidget {
  const PrebookingTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pre-booking Queries', style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black)),
          centerTitle: true,
          flexibleSpace: Container(
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Flights',),
              Tab( text: 'Hotels',),
              Tab(text: 'Packages',),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            PreBookQus(),
            PreBookQusHotel(),
            PreBookQusPack()
          ],
        ),
      ),
    );
  }
}
