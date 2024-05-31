import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/buttons/seat_widget.dart';
import '../ticket_confirmation.dart';

class PlaneTicket extends StatefulWidget {
  const PlaneTicket({super.key, required this.flightdata});
  final Map<String, dynamic> flightdata;

  @override
  State<PlaneTicket> createState() => _PlaneTicketState();
}

class _PlaneTicketState extends State<PlaneTicket> {
  List<String> seatBookText = [];

  var seatInfo = [
    [0, 1, 1, 0],
    [1, 1, 1, 1],
    [0, 0, 0, 0],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 1, 1],
    [1, 1, 0, 1],
    [0, 0, 0, 0],
    [0, 0, 1, 1],
    [1, 0, 0, 1],
  ];

  void seatOnTap(int row, int column) {
    List<String> seatAlpha = ['A', 'B', 'C', 'D'];
    String seatLabel = "${seatAlpha[column]}${row + 1}";
    if (seatInfo[row][column] == 1) {
      setState(() {
        seatBookText.add(seatLabel);
        seatInfo[row][column] = 2;
      });
    } else if (seatInfo[row][column] == 2) {
      setState(() {
        seatBookText.remove(seatLabel);
        seatInfo[row][column] = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.87,
              child: ElevatedButton(
                onPressed: () => Get.to(TicketConfirmationScreen(
                  flightData: widget.flightdata,
                  seatInfo: seatInfo,
                  seatBookText: seatBookText,
                  user: FirebaseAuth.instance.currentUser!,
                )),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.ubuntu(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height:4,),
          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        title: Text(
          "Choose Ticket",
          style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1, // Border width
                            ),
                            borderRadius: BorderRadius.circular(6.0), // Border radius
                          ),
                          child: Container(
                            color: Colors.black26,
                            height: 18,
                            width: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Available',
                          style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1.5, // Border width
                            ),
                            borderRadius: BorderRadius.circular(6.0), // Border radius
                          ),
                          child: Container(
                            color: Colors.black,
                            height: 18,
                            width: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Selected',
                          style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.black12,
                          ),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Unavailable',
                          style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.grey.shade50,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.grey.shade50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            seatLabel('A'),
                            seatLabel('B'),
                            seatLabel(''),
                            seatLabel('C'),
                            seatLabel('D'),
                          ],
                        ),
                        for (int i = 0; i < seatInfo.length; i++) ...[
                          Seat(sL: i, info: seatInfo[i], seaTonTap: seatOnTap),
                          const SizedBox(height: 8),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Seat',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('$seatBookText'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total: ',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\$${(seatBookText.length * widget.flightdata['ourPrice']).toString()}',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget seatLabel(String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.grey.shade50,
      ),
      height: 40,
      width: 40,
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
