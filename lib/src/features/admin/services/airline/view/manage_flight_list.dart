import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/add_flight_model.dart';
import 'edit_flight_list.dart';

class ManageFlightListScreen extends StatefulWidget {
  const ManageFlightListScreen({super.key});
  @override
  State<ManageFlightListScreen> createState() => _ManageFlightListScreenState();
}

class _ManageFlightListScreenState extends State<ManageFlightListScreen> {
  late TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Manage Flights',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
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
                          icon: const Icon(Icons.search, color: Colors.black87),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('flights').snapshots(),
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
                  String airlineName = document['airlineName'].toString().toLowerCase();
                  String planeModel = document['planeModel'].toString().toLowerCase();
                  String searchText = _searchController.text.toLowerCase();
                  return airlineName.contains(searchText) || planeModel.contains(searchText);
                }).toList();

                return ListView.builder(
                  itemCount: filteredFlights.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = filteredFlights[index];
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => FlightDetailScreen(data: data, ),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                                      child: Image.network(
                                        data['imgUrl'] ?? '',
                                        height: 90,
                                        width: MediaQuery.of(context).size.width * .2,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data['airlineName'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(Icons.circle, size: 5),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${data['planeModel']}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.location_on_rounded,
                                            color: Colors.black87,
                                            size: 15,
                                          ),
                                          Text(
                                            '${data['fromPlace']}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black87,
                                            size: 13,
                                          ),
                                          Text(
                                            '${data['toPlace']}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${data['regularPrice']}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red,

                                              ),
                                            ),
                                            Text(
                                              '\$${data['ourPrice']}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 18),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditFlightForm(
                                            flight: Flight(
                                              id: document.id,
                                              airlineName: data['airlineName'],
                                              date: data['date'],
                                              // fromTime: data['fromTime'],
                                              // toTime: data['toTime'],
                                              duration: data['duration'],
                                              fromPlace: data['fromPlace'],
                                              toPlace: data['toPlace'],
                                              planeModel: data['planeModel'],
                                              refundable: data['refundable'],
                                              insurance: data['insurance'],
                                              baggage: data['baggage'],
                                              flightClass: data['flightClass'],
                                              regularPrice: data['regularPrice'],
                                              ourPrice: data['ourPrice'],
                                              imgUrl: data['imgUrl'],
                                              stoppage: data['stoppage'],
                                              departureTerminal: data['departureTerminal'],
                                              departureAirport: data['departureAirport'],
                                              arrivalTerminal: data['arrivalTerminal'],
                                              arrivalAirport: data['arrivalAirport'],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, size: 18),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Delete Flight'),
                                            content: const Text('Are you sure you want to delete this flight?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance.collection('flights').doc(document.id).delete().then((value) {
                                                    Navigator.pop(context);
                                                  }).catchError((error) {});
                                                },
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
