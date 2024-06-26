import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/menus/user_navigation_menu.dart';

class TicketConfirmationScreen extends StatefulWidget {
  final Map<String, dynamic> flightData;
  final List<List<int>> seatInfo;
  final List<String> seatBookText;
  User? user = FirebaseAuth.instance.currentUser;

  TicketConfirmationScreen(
      {super.key,
      required this.flightData,
      required this.seatInfo,
      required this.seatBookText,
      required this.user});


  @override
  State<TicketConfirmationScreen> createState() => _TicketConfirmationScreenState();
}

class _TicketConfirmationScreenState extends State<TicketConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 135,
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
                const SizedBox(
                  height: 2,
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
                          'Balance',
                          style: GoogleFonts.ubuntu(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'USD ${(widget.seatBookText.length * widget.flightData['ourPrice']).toString()}',
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
                      showProcessing();
                      await insertBookingInfo();
                      Get.offAll(() => const NavigationMenu());
                      Get.snackbar("Success",
                          "Payment Completed, Wait for a minute!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10),
                      ),
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
        backgroundColor: Colors.white,
        title: Text(
          'Ticket Confirmation',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/route.svg',
                width: 320,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.flightData['fromPlace']}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${widget.flightData['toPlace']}',
                      style: GoogleFonts.ubuntu(
                          fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flight Details',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.flightData['airlineName']}',
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
                                  '${widget.flightData['planeModel']}',
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat('E,dMMM')
                                  .format(DateTime.parse(widget.flightData['date'])),
                              style: GoogleFonts.ubuntu(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          ///image
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      widget.flightData['imgUrl'] ?? '',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.flightData['fromTime']}',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${widget.flightData['fromPlace']}',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${widget.flightData['duration']}',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 5,
                                  child: const Divider(thickness: 1),
                                ),
                                Text(
                                  '${widget.flightData['stoppage']}',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${widget.flightData['toTime']}',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '${widget.flightData['toPlace']}',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flight Facilities',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Refundable:',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.flightData['refundable'] ? 'Yes' : 'No',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: widget.flightData['refundable']
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Insurance:',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.flightData['insurance'] ? 'Yes' : 'No',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: widget.flightData['refundable']
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check-in:',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${widget.flightData['baggage']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fare Details',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '',
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Seat',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${widget.seatBookText}",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Traveller',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${widget.seatBookText.length}",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fare Price',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(

                              "\$${(widget.seatBookText.length * widget.flightData['ourPrice']).toString()}",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style: GoogleFonts.ubuntu(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "${00}",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: const Divider(thickness: 1),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: GoogleFonts.ubuntu(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '\$${(widget.seatBookText.length * widget.flightData['ourPrice']).toString()}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showProcessing() {
    Get.dialog(const AlertDialog(
      title: Text("Payment Screen"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      ),
    ));
  }

  insertBookingInfo() async {
    final CollectionReference flights =
        FirebaseFirestore.instance.collection('flights');

    final CollectionReference booking =
        FirebaseFirestore.instance.collection('booking');

    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    final user = FirebaseAuth.instance.currentUser;
    DocumentReference bookingRef = await booking.add({
      'flightDataId': widget.flightData,
      'seatBookText': widget.seatBookText,
      'paymentStatus': true,
      'bookingStatus': false,
      'bookingCancel': false,
      'ticketID': _generateRandomId(),
      'price': widget.seatBookText.length * widget.flightData['ourPrice'],
      'bookedByName': user?.displayName ?? "User",
      'bookedByEmail': user?.email,
      'userID': user?.uid,
      // 'updatedData': widget.updatedData

    });
  }

  String _generateRandomId() {
    print('$_generateRandomId');
    Random random = Random();
    return random.nextInt(100000000).toString();
  }
}
