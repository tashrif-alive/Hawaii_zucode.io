import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FlightApprovedList extends StatefulWidget {
  const FlightApprovedList({super.key});

  @override
  State<FlightApprovedList> createState() => _FlightApprovedListState();
}

class _FlightApprovedListState extends State<FlightApprovedList> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  void _updateApprovalStatus(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('booking')
          .doc(documentId)
          .update({
        'isApproved': true,
      });
      await FirebaseFirestore.instance
          .collection('booking')
          .doc(documentId)
          .update({
        'bookingStatus': true,
      });
      if (kDebugMode) {
        print('Document updated successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating document: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Search flights',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                                style: GoogleFonts.ubuntu(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.search,
                                  color: Colors.black87),
                              onPressed: () {
                                if (kDebugMode) {
                                  print(_searchController.text);
                                } // Trigger search
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          height: 31,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('booking')
                    .where('bookingStatus', isEqualTo: true)
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

                  List<DocumentSnapshot> filteredFlights =
                      snapshot.data!.docs.where((document) {
                    String airlineName = document['flightDataId']['airlineName']
                        .toString()
                        .toLowerCase();
                    String searchText = _searchController.text.toLowerCase();
                    return airlineName.contains(searchText);
                  }).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                            'Flight Request (${filteredFlights.length})',
                            style: GoogleFonts.ubuntu(
                                fontSize: 12, fontWeight: FontWeight.w300)),
                      ),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children:
                            filteredFlights.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${data['flightDataId']['fromPlace']}',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 15,
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
                                        '${data['flightDataId']['toPlace']}',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat('E, d MMM').format(
                                            DateTime.parse(
                                                data['flightDataId']['date'])),
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
                                        '${data['flightDataId']['stoppage']}',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.circle,
                                        size: 5,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${data['flightDataId']['duration']}',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.circle,
                                        size: 5,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        '${data['flightDataId']['flightClass']}',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${data['flightDataId']['airlineName']}',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
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
                                        '${data['seatBookText']}',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const Spacer(),
                                      data['isApproved'] == true
                                          ? const Text('Confirmed')
                                          : const Chip(
                                              backgroundColor: Colors.grey,
                                              label: Text('Pending'),
                                            ),
                                      IconButton(
                                        icon: const Icon(Icons.approval),
                                        onPressed: () {
                                          _updateApprovalStatus(document.id);
                                        },
                                      ),
                                    ],
                                  ),
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
