import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/menus/user_navigation_menu.dart';
import '../../../admin/widgets/admin_textform_field.dart';

class BookingReviewHotel extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic>? hotelData;
  final List<int>? rooms;
  final List<DateTime?> dates;
  final String price;
  final int nightCount;
  User? user = FirebaseAuth.instance.currentUser;

  BookingReviewHotel(
      {super.key,
      required this.rooms,
      required this.dates,
      required this.hotelData,
      required this.price,
      required this.nightCount,
      required this.data,
      required this.user});

  @override
  State<BookingReviewHotel> createState() => _BookingReviewHotelState();
}

class _BookingReviewHotelState extends State<BookingReviewHotel> {
  // Map<String, dynamic>? hotelData;

  TextEditingController nidController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    processHotelBooking() async {
      if (widget.dates.length < 2) {
        Get.snackbar("Error", "Please select checkIn-checkout date");
      }
      final CollectionReference booking =
          FirebaseFirestore.instance.collection('hotelBooking');

      DateTime checkInDateTime = widget.dates[0]!;
      DateTime checkOutDateTime = widget.dates[1]!;

      final user = FirebaseAuth.instance.currentUser;

      DocumentReference bookingRef = await booking.add({

        "widget_data": widget.data,
        "hotel_data": widget.hotelData,
        "checkIn": Timestamp.fromDate(checkInDateTime),
        "checkOut": Timestamp.fromDate(checkOutDateTime),
        "night_count": widget.nightCount,
        'userID': user?.uid,
        'bookedByName': user?.displayName ?? "User",
        'bookedByEmail': user?.email,
        'room': widget.rooms,
        "price": widget.price,
        'nightCount':widget.nightCount,
        'date': widget.dates,
        'bookedByNid':nidController.text,
        'bookedByPhone':phoneController.text,
        'paymentStatus': true,
        'bookingStatus': false,
        'bookingCancel': false,
        'reservationID': _generateRandomId(),
        'wishlistStatus': false,
        'roomNo':_generateRandomRoomId()
        // 'updatedData': widget.updatedData
      });
    }

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 125,
        child: Material(
          elevation: 2,
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Method',
                      style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.orange,
                      ),
                      height: 30,
                      width: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.paypal,
                            color: Colors.white,
                          ),
                          Text(
                            'ZuPay',
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total Amount',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'USD ${widget.price}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      await processHotelBooking();
                      Get.offAll(() => const NavigationMenu());
                      Get.snackbar(
                          "Success", "Payment Completed, Wait a Second..");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Sets a border radius of 20
                      ), // Button padding
                    ),
                    child: Text("Pay Now", style: GoogleFonts.ubuntu()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Booking Review',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.data['imgUrl'] ?? '',
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    '${widget.data['hotelName']}',
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          i < widget.data['rating']
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        )
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text('${widget.data['location']}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 14, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 2),
                  Text('${widget.hotelData?['address'] ?? ''}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 13, fontWeight: FontWeight.w300),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ]),
              ]),
            ),
            Container(
              color: Colors.grey.shade100,
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Travel Details',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.calendar,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Check-In',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${DateFormat('E, d MMM').format(widget.dates[0]!)}',
                            style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '13:00',
                            style: GoogleFonts.ubuntu(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.purple.shade100,
                            border: Border.all(
                              color: Colors.black45,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '${widget.nightCount}Night',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.calendar,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Check-Out',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${DateFormat('E, d MMM').format(widget.dates[1]!)}',
                            style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '11:00',
                            style: GoogleFonts.ubuntu(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.userGroup,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("Guests & Rooms", style: GoogleFonts.ubuntu())
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text('${widget.rooms?[0]}Rooms, ${widget.rooms?[1]}Guests',
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade100,
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Travel Details',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.rooms?[0]}Rooms,${widget.nightCount}Night',
                          style:
                              GoogleFonts.ubuntu(fontWeight: FontWeight.w400)),
                      Text(
                        '\$${widget.price}',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Taxes & Charges',
                          style:
                              GoogleFonts.ubuntu(fontWeight: FontWeight.w400)),
                      Text(
                        '\$0.0',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discounts',
                          style:
                              GoogleFonts.ubuntu(fontWeight: FontWeight.w400)),
                      Text(
                        '\$0.0',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      Text(
                        '\$${widget.price}',
                        style: GoogleFonts.ubuntu(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade100,
              height: 12,
            ),
            ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Traveller Details",
                    style: GoogleFonts.ubuntu(
                        fontSize: 16, fontWeight: FontWeight.w600),
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
                    '${widget.user?.displayName}',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.circle, size: 5),
                  const SizedBox(width: 5),
                  Text(
                    '${widget.user?.email}',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [

                      AdminTextFormField(
                        controller: nidController,
                        hintText: 'NID no.',
                        prefixIcon: FontAwesomeIcons.idCard,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Departure Terminal';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8,),
                      AdminTextFormField(
                        hintText: 'Phone no.',
                        controller: phoneController,
                        prefixIcon: FontAwesomeIcons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Departure Terminal';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  String _generateRandomId() {
    print('$_generateRandomId');
    Random random = Random();
    return random.nextInt(100000000).toString();
  }

  String _generateRandomRoomId() {
    print('$_generateRandomId');
    Random random = Random();
    return random.nextInt(100).toString();
  }
}
