import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlightBookedScreen extends StatefulWidget {
  const FlightBookedScreen({super.key});

  @override
  State<FlightBookedScreen> createState() => _FlightBookedScreenState();
}

class _FlightBookedScreenState extends State<FlightBookedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('booking')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<DocumentSnapshot> flights = snapshot.data!.docs;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'My ticket (${flights.length})',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: flights.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return Material(
                            borderRadius: BorderRadius.circular(16.0),
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  ExpansionTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Flight Details",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                    subtitle: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${data['flightDataId']['fromPlace']}",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
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
                                              "${data['flightDataId']['toPlace']}",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        data['isApproved'] == true
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  'Confirmed',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Text(
                                                  'Pending',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat('E, d MMM').format(
                                                      DateTime.parse(
                                                          data['flightDataId']
                                                              ['date'])),
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Icon(Icons.circle,
                                                    size: 5),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${data['flightDataId']['stoppage']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Icon(Icons.circle,
                                                    size: 5),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${data['flightDataId']['duration']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Icon(Icons.circle,
                                                    size: 5),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${data['flightDataId']['flightClass']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: Colors.white,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      data['flightDataId']
                                                              ['imgUrl'] ??
                                                          '',
                                                      height: 30,
                                                      width: 30,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${data['flightDataId']['airlineName']}',
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
                                                  '${data['flightDataId']['planeModel']}',
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  DateFormat('E, d MMM').format(
                                                      DateTime.parse(
                                                          data['flightDataId']
                                                              ['date'])),
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat('E, d MMM').format(
                                                      DateTime.parse(
                                                          data['flightDataId']
                                                              ['date'])),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${data['flightDataId']['fromTime']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '${data['flightDataId']['duration']}',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.circle,
                                                          size: 5,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                          height: 5,
                                                          child: const Divider(
                                                              thickness: 1.5),
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
                                                  '${data['flightDataId']['toTime']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${data['flightDataId']['fromPlace']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${data['flightDataId']['toPlace']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${data['flightDataId']['departureTerminal']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${data['flightDataId']['arrivalTerminal']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Terminal ${data['flightDataId']['departureAirport']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  'Terminal ${data['flightDataId']['arrivalAirport']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                  'Cabin: ${data['flightDataId']['baggage']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                  'Check-in: ${data['flightDataId']['baggage']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 2,
                                    color: Colors.grey.shade50,
                                  ),
                                  ExpansionTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Traveller Details",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/user.svg',
                                          height: 22,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          '${data['bookedByName']}',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(Icons.circle, size: 5),
                                        const SizedBox(width: 5),
                                        Text(
                                          '${data['bookedByEmail']}',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 3),
                                                  child: Icon(
                                                    FontAwesomeIcons.map,
                                                    size: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 3),
                                                  child: Icon(
                                                    FontAwesomeIcons.idCard,
                                                    size: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 3),
                                                  child: Icon(
                                                    FontAwesomeIcons.chair,
                                                    size: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Seat',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${data['seatBookText']}',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 3),
                                                  child: Icon(
                                                    FontAwesomeIcons.usd,
                                                    size: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Fare Cost',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${data['flightDataId']['ourPrice']}  USD',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 3),
                                                  child: Icon(
                                                    FontAwesomeIcons.moneyBills,
                                                    size: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Payment Status',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  data['paymentStatus']
                                                      ? 'Paid'
                                                      : 'Due',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 8,
                                    color: Colors.grey.shade50,
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
