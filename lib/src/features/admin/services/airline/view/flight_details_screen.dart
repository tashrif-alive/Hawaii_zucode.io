import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlightDetailScreen extends StatelessWidget {
  final Map<String, dynamic> flightData;

  const FlightDetailScreen({super.key, required this.flightData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Flight Details',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${flightData['airlineName']}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.circle,size: 5,),
                            const SizedBox(width: 5),
                            Text(
                              '${flightData['planeModel']}',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('E,dMMM').format(DateTime.parse(flightData['date'])),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ///image
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  flightData['imgUrl'] ?? '',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 18,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${flightData['fromTime']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '${flightData['fromPlace']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              '${flightData['duration']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,height: 5,
                              child: const Divider(thickness: 1),
                            ),
                            Text(
                              '${flightData['stoppage']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${flightData['toTime']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '${flightData['toPlace']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .8,

                      child: const Divider(thickness: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${flightData['flightClass']}',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          flightData['refundable'] ? 'Yes' : 'No',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          flightData['insurance'] ? 'Yes' : 'No',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${flightData['regularPrice']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              '${flightData['ourPrice']}',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
