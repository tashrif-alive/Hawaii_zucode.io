import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/airline_info_model.dart';
import 'edit_airline list.dart';


class AirlineListScreen extends StatefulWidget {
  const AirlineListScreen({super.key});

  @override
  State<AirlineListScreen> createState() => _AirlineListScreenState();
}

class _AirlineListScreenState extends State<AirlineListScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.grey.shade50,
        title: Text(
          'Airline List',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
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
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.poppins(
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
                                // if (_searchController.text.isNotEmpty) {
                                //   widget.onSearch(_searchController.text);
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
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('airlines')
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
                    String airlineName =
                        document['airline'].toString().toLowerCase();
                    String planeModel =
                        document['airplaneModel'].toString().toLowerCase();
                    String searchText = _searchController.text.toLowerCase();
                    return airlineName.contains(searchText) ||
                        planeModel.contains(searchText);
                  }).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text('Total Airline (${filteredFlights.length})',
                            style: GoogleFonts.ubuntu(
                                fontSize: 12, fontWeight: FontWeight.w300)),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children:
                            filteredFlights.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              data['imgUrl'] ?? '',
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${data['airline']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                const Icon(
                                                  Icons.circle,
                                                  size: 5,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '${data['airplaneModel']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_rounded,
                                                  size: 12,
                                                ),
                                                Text(
                                                  '${data['address']}',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${data['routes']}',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit,
                                                size: 15),
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         EditAirlineForm(
                                              //       airline: Airline(
                                              //         id: data['id'],
                                              //         airline: data['airline'],
                                              //         address: data['address'],
                                              //         airplaneModel: data['airplaneModel'],
                                              //         facilities: data['facilities'],
                                              //         imgUrl: data['imgUrl'],
                                              //         routes: List<String>.from(data['routes'] ?? []),
                                              //         refundable: data['refundable'],
                                              //         insurance: data['insurance'],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        data['refundable']
                                            ? 'Refundable'
                                            : 'Non-refundable',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        data['insurance']
                                            ? '70%-insurance'
                                            : 'No-insurance',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '${data['facilities']}'.toUpperCase(),
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 8,)
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
