import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/alience_carousel.dart';
import '../../components/flight/flight_fare_list.dart';
import '../../components/hotel/hotel_search_box.dart';

class UserHotelTab extends StatefulWidget {
  const UserHotelTab({super.key});
  @override
  State<UserHotelTab> createState() => _UserHotelTabState();
}

class _UserHotelTabState extends State<UserHotelTab> {
  ///Search
  void _handleSearch(Map<String, String> searchData) {
    setState(() {
      hotelName = searchData['hotelName'] ?? '';
      location = searchData['location'] ?? '';
      date = searchData['date'] ?? '';

    });
    print('Location: $location, hotelName: $hotelName, Date: $date,');
  }
  String location = '';
  String hotelName = '';
  String date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: HotelSearchBox(
                hintText: 'Search for hotels...',
                onSearch: _handleSearch,
              ),
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
