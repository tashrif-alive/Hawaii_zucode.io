import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../admin/services/hotel/view/hotel_detail_admin.dart';

class HotelListScreenUser extends StatefulWidget {
  const HotelListScreenUser({Key? key});

  @override
  State<HotelListScreenUser> createState() => _HotelListScreenUserState();
}

class _HotelListScreenUserState extends State<HotelListScreenUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
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

            List<DocumentSnapshot> hotels = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('All hotels (${hotels.length})',
                        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w300)),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: hotels.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = hotels[index].data() as Map<String, dynamic>;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HotelDetailAdmin(data: data)),
                          );
                        },
                        child: Material(
                          elevation: 1,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(6),
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
                                    horizontal: 6.0,
                                  ),
                                  child: Text(
                                    data['hotelName'],
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.black87,
                                        size: 15,
                                      ),
                                      Text(
                                        data['location'],
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '\$${data['regularHotelCost']}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              decoration: TextDecoration.lineThrough,
                                              decorationColor: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '\$${data['offeredHotelCost']}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.share,
                                            size: 16,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Icon(Icons.favorite, color: Colors.blueGrey.shade200, size: 16),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
