import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingReviewHotel extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic>? hotelData;

  const BookingReviewHotel({super.key, required this.data, this.hotelData});

  @override
  State<BookingReviewHotel> createState() => _BookingReviewHotelState();
}

class _BookingReviewHotelState extends State<BookingReviewHotel> {


  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(12),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                    ),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(12),
                      child: Image.network(
                        widget.data['imgUrl'] ?? '',
                        height: 100,

                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.data['hotelName']}',
                        style: GoogleFonts.ubuntu(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i < widget.data['rating']
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            )
                        ],
                      ),
                      const SizedBox(height: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.data['location']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('${widget.hotelData?['address'] ?? ''}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w300)),
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
