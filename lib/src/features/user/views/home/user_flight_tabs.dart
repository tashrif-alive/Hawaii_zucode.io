import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/alience_carousel.dart';
import '../../components/destination_poster.dart';
import '../../components/flight/flight_fare_list.dart';
import '../../components/flight/flight_search_box.dart';
import '../../components/other_services_bar.dart';

class UserFlightTab extends StatefulWidget {
  const UserFlightTab({super.key});
  @override
  State<UserFlightTab> createState() => _UserFlightTabState();
}

class _UserFlightTabState extends State<UserFlightTab> {
  ///Search
  void _handleSearch(Map<String, String> searchData) {
    setState(() {
      from = searchData['from'] ?? '';
      to = searchData['to'] ?? '';
      date = searchData['date'] ?? '';
      flightClass = searchData['class'] ?? '';
    });
    print('From: $from, To: $to, Date: $date, Class: $flightClass');
  }
  String from = '';
  String to = '';
  String date = '';
  String flightClass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const DestinationPoster(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FlightSearchBox(
                hintText: 'Search for flights...',
                onSearch: _handleSearch,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 8),
              child: ExtraServicesBar(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 15, right: 15),
              child: Text(
                'Your recent searches',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Why Book Hawaii?',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const AliancesBannerCarousel(),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: FlightFareList(),
            ),
          ],
        ),
      ),
    );
  }
}
