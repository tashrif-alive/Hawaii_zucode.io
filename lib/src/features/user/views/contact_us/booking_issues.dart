import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IssuesBooking extends StatelessWidget {
  const IssuesBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Issues with Booking",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
        centerTitle: true,
        elevation: 1,

      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Seems you don't have any bookings",
                style: GoogleFonts.poppins(fontSize:14),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
