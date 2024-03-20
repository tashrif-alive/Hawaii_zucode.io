import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HotelSearchResults extends StatelessWidget {
  final Map<String, String> searchData;

  const HotelSearchResults({super.key, required this.searchData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
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
              String? hotelName = searchData['hotelName']?.toLowerCase();
              //String? location = searchData['location']?.toLowerCase();
              String? date = searchData['date'] != null
                  ? DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(searchData['date']!))
                  : null;
        
              return document['hotelName']
                  .toString()
                  .toLowerCase()
                  .contains(hotelName ?? '')
                  // document['location']
                  //     .toString()
                  //     .toLowerCase()
                  //     .contains(location ?? '')
                  //     &&
                  // document['date'].toString().contains(date ?? '')
              ;
            }).toList();
        
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Search Results (${filteredFlights.length})',
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => FlightDetailScreen(
                          //       flightData: data,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade50,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade50,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          data['imgUrl'] ?? '',
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data['hotelName'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.share,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Icon(Icons.favorite,
                                                  color: Colors.blueGrey.shade200,
                                                  size: 18),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.location_on_rounded,
                                                color: Colors.black87,
                                                size: 15,
                                              ),
                                              Text(
                                                '${data['location']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(Icons.circle, size: 5),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${data['hotelType']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.amber.shade200,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '\$${data['regularHotelCost']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                  decoration: TextDecoration.lineThrough,
                                                  decorationColor: Colors.white,
                                                ),
                                              ),
        
        
                                              Text(
                                                '\$${data['offeredHotelCost']}',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                            ],
                                          )
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
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
