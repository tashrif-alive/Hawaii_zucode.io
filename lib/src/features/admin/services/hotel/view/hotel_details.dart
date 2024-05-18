import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDetailScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const HotelDetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  Map<String, dynamic>? hotelData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHotelByModel(widget.data['location']);
  }

  Future<void> getHotelByModel(String model) async {
    setState(() {
      isLoading = true;
    });

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('hotelInformation')
          .where('location', isEqualTo: model)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        setState(() {
          hotelData = doc.data() as Map<String, dynamic>;
        });
      } else {
        print('No hotel found with location: $model');
      }
    } catch (e) {
      print('Error getting hotel details: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      child: Image.network(
                        widget.data['imgUrl'] ?? '',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.data['hotelName']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.circle,
                              size: 5,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${widget.data['hotelType']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.data['location']}',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                                Text('${hotelData?['address'] ?? ''}',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              height: 30,
                              width: 30,
                              child: const Icon(
                                Icons.map_outlined,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    '8.7',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Excellent',
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.blue),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '23 Ratings',
                                      style: GoogleFonts.ubuntu(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                height: 30,
                                width: 30,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 5, color: Colors.blueGrey.shade50),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 12, left: 12, right: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travel Details',
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Guests',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(height: 5, color: Colors.blueGrey.shade50),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 12, left: 12, right: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Facilities',
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${hotelData?['facilities'] ?? ''}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],)

                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: (hotelData?['facilities'] ?? '')
                        //       .split(',')
                        //       .map<Widget>((facility) => Text(
                        //             facility.trim(),
                        //             style: GoogleFonts.ubuntu(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.w300),
                        //           ))
                        //       .toList(),
                        // ),
                      ],
                    ),
                  ),

                  Text('Cost: \$${widget.data['offeredHotelCost']}'),
                  Text('ID: ${widget.data['id']}'),

                  // Add more fields as needed
                ],
              ),
      ),
    );
  }
}
