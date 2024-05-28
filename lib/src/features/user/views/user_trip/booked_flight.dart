import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightBookedScreen extends StatefulWidget {
  const FlightBookedScreen({super.key});

  @override
  State<FlightBookedScreen> createState() => _FlightBookedScreenState();
}

class _FlightBookedScreenState extends State<FlightBookedScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
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
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
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
                              icon: const Icon(Icons.search, color: Colors.black87),
                              onPressed: () {
                                if (kDebugMode) {
                                  print(_searchController.text);
                                } // Trigger search
                              }),
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
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('booking').snapshots(),
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

                  List<DocumentSnapshot> filteredFlights = snapshot.data!.docs.where((document) {
                    String airlineName = document['flightDataId']['airlineName'].toString().toLowerCase();
                    String searchText = _searchController.text.toLowerCase();
                    return airlineName.contains(searchText);
                  }).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text('My ticket (${filteredFlights.length})',
                            style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w300)),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: filteredFlights.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Row(
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
                                      ? const Text('Confimed')
                                      : Chip(
                                          backgroundColor: Colors.grey,
                                          label: const Text('Panding'),
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
            ),
          ],
        ),
      ),
    );
  }
}
