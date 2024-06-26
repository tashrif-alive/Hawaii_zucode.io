import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/components/flight/review_flight.dart';
import 'package:intl/intl.dart';


class BusSearchResults extends StatelessWidget {
  final Map<String, String> searchData;

  const BusSearchResults({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available flights'),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('buses').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

          List<DocumentSnapshot> filteredFlights =
          snapshot.data!.docs.where((document) {
            String? from = searchData['sourceLocation']?.toLowerCase();
            String? to = searchData['destinationLocation']?.toLowerCase();
            String? date = searchData['date'] != null
                ? DateFormat('yyyy-MM-dd')
                .format(DateTime.parse(searchData['date']!))
                : null;

            print(date);
            return document['sourceLocation']
                .toString()
                .toLowerCase()
                .contains(from ?? '') &&
                document['destinationLocation']
                    .toString()
                    .toLowerCase()
                    .contains(to ?? '') &&
                document['date'].toString().contains(date ?? '');
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Available buses (${filteredFlights.length})',
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w300)),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: filteredFlights.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlightReviewScreen(
                              flightData: data,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(6.0),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //       color: Colors.white,
                              //     ),
                              //     child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //       child: Image.network(
                              //         data['imgUrl'] ?? '',
                              //         height: 50,
                              //         width: 50,
                              //         fit: BoxFit.fill,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${data['busCompany']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(Icons.circle,size: 5,),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${data['departureTime']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    DateFormat('MMMd, yyyy')
                                        .format(DateTime.parse(data['date'])),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  // Text(
                                  //   '${data['flightClass']}',
                                  //   style: GoogleFonts.poppins(
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w300,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
