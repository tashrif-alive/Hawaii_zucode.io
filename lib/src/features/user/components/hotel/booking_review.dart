import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingReviewHotel extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic>? hotelData;
  final List<int>? rooms;
  final List<DateTime?> dates;
  final String price;
  final int nightCount;

  const BookingReviewHotel(
      {super.key,
      required this.rooms,
      required this.dates,
      required this.hotelData,
      required this.price,
      required this.nightCount,
      required this.data});

  @override
  State<BookingReviewHotel> createState() => _BookingReviewHotelState();
}

class _BookingReviewHotelState extends State<BookingReviewHotel> {
  Map<String, dynamic>? hotelData;

  @override
  Widget build(BuildContext context) {
    processHotelBooking() async {
      if (widget.dates.length < 2) {
        Get.snackbar("Error", "Please select checkin-checkout date");
      }
      final CollectionReference booking = FirebaseFirestore.instance.collection('hotelBooking');

      DateTime checkInDateTime = widget.dates[0]!;
      DateTime checkOutDateTime = widget.dates[1]!;

      final user = FirebaseAuth.instance.currentUser;
      DocumentReference bookingRef = await booking.add({
        "widget_data": widget.data,
        "hotel_data": hotelData,
        "checkIn": Timestamp.fromDate(checkInDateTime),
        "checkOut": Timestamp.fromDate(checkOutDateTime),
        "night_count": widget.nightCount,
        'userID': user?.uid,
        // 'updatedData': widget.updatedData
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Review',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.data['imgUrl'] ?? '',
                        height: 100,
                        width: 160,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${widget.data['hotelName']}',
                        style: GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i < widget.data['rating'] ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            )
                        ],
                      ),
                      const SizedBox(height: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${widget.data['location']}',
                              style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('${widget.hotelData?['address'] ?? ''}',
                              style: GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w300)),
                          Text('Rooms: ${widget.rooms?[0]}, Guests: ${widget.rooms?[1]}'),
                          Text('Check-in: ${widget.dates[0]}, Check-out: ${widget.dates[1]}'),
                          Text('Price: ${widget.price}'),
                          ElevatedButton(
                            onPressed: () async {
                              await processHotelBooking();
                              Get.snackbar("Success", "Payment Completed, Your Seat is Reserved");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Button color
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Sets a border radius of 20
                              ), // Button padding
                            ),
                            child: Text("Continue", style: GoogleFonts.ubuntu()),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
