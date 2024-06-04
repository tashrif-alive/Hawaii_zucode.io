import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../admin/services/hotel/view/traveller_details.dart';

class FlightReviewScreen extends StatelessWidget {
  final Map<String, dynamic> flightData;

  const FlightReviewScreen({super.key, required this.flightData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\$${flightData['regularPrice']}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    // Add line-through effect
                    decorationColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '\$${flightData['ourPrice']}',
                  style: GoogleFonts.ubuntu(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                "Continue",
                style: GoogleFonts.ubuntu(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                User? user = FirebaseAuth.instance.currentUser;
                final updatedFlightData = {
                  ...flightData,
                  "userID": user?.email,
                  'bookedByName': user?.displayName ?? "User",
                  'bookedByEmail': user?.email,
                };

                Get.to(TravellerDetails(flightData: updatedFlightData));

              },
            ),
          ],
        ),
      ),
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
          'Review Flight',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${flightData['fromPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${flightData['toPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          DateFormat('E, d MMM')
                              .format(DateTime.parse(flightData['date'])),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${flightData['stoppage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${flightData['duration']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${flightData['flightClass']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              flightData['imgUrl'] ?? '',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${flightData['airlineName']}',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${flightData['planeModel']}',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('E, d MMM')
                              .format(DateTime.parse(flightData['date'])),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          DateFormat('E, d MMM')
                              .format(DateTime.parse(flightData['date'])),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${flightData['fromTime']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Column(
                          children: [
                            Text(
                              '${flightData['duration']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 5,
                                  child: const Divider(thickness: 1.5),
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${flightData['toTime']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${flightData['fromPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${flightData['toPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${flightData['departureTerminal']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${flightData['arrivalTerminal']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terminal ${flightData['departureAirport']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Terminal ${flightData['arrivalAirport']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.backpack,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Cabin: ${flightData['baggage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.luggage,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Check-in: ${flightData['baggage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: const Divider(thickness: 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Refundable',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          flightData['refundable']
                              ? Icons.check_circle_outline
                              : Icons.not_interested,
                          size: 17,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Insurance',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          flightData['insurance']
                              ? Icons.check_circle_outline
                              : Icons.not_interested,
                          size: 17,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 12,
              color: Colors.blueGrey.shade50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fare Summary',
                      style: GoogleFonts.ubuntu(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fare Type',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          flightData['refundable']
                              ? 'Refundable'
                              : 'Partially Refundable',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: flightData['refundable']
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Base Fare',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$${flightData['ourPrice']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taxes & Fees',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$00',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: const Divider(thickness: 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Instant Off',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '\$00',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: const Divider(thickness: 1),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${flightData['ourPrice']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
