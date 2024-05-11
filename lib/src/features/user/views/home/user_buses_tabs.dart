import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/components/bus/buses_search_box.dart';
import '../../components/alience_carousel.dart';
import '../../components/other_services_bar.dart';

class UserBusTab extends StatefulWidget {
  const UserBusTab({super.key});
  @override
  State<UserBusTab> createState() => _UserBusTabState();
}

class _UserBusTabState extends State<UserBusTab> {
  ///Search
  void _handleSearch(Map<String, String> searchData) {
    setState(() {
      sourceLocation = searchData['sourceLocation'] ?? '';
      destinationLocation = searchData['destinationLocation'] ?? '';
      date = searchData['date'] ?? '';
    });
    print('sourceLocation: $sourceLocation, destinationLocation: $destinationLocation, Date: $date');
  }
  String sourceLocation = '';
  String destinationLocation = '';
  String date = '';
  //String flightClass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BusSearchBox(
                hintText: 'Search for Buses...',
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
          ],
        ),
      ),
    );
  }
}
