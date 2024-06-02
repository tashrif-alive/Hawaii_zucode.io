import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../user/components/ticket/view/plane_ticket.dart';
import '../../../widgets/admin_textform_field.dart';

class TravellerDetails extends StatefulWidget {
  final Map<String, dynamic> flightData;

  const TravellerDetails({super.key, required this.flightData});

  @override
  State<TravellerDetails> createState() => _TravellerDetailsState();
}

class _TravellerDetailsState extends State<TravellerDetails> {
  TextEditingController nidController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\$${widget.flightData['regularPrice']}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                    // Add line-through effect
                    decorationColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '\$${widget.flightData['ourPrice']}',
                  style: GoogleFonts.ubuntu(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            ElevatedButton(
              child: Text(
                "Select Seat",
                style: GoogleFonts.ubuntu(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                final updatedData = {
                  ...widget.flightData,
                  "nid": nidController.text,
                  "phone": phoneController.text,
                  "address": addressController.text
                };
                Get.to(PlaneTicket(flightdata: updatedData));
              },
            ),
          ],
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
          'Review Flight',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.flightData['fromPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w600),
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
                          '${widget.flightData['toPlace']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w600),
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
                              DateTime.parse(widget.flightData['date'])),
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
                          '${widget.flightData['stoppage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.flightData['duration']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.flightData['flightClass']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.flightData['imgUrl'] ?? '',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('E, d MMM').format(
                              DateTime.parse(widget.flightData['date'])),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          DateFormat('E, d MMM').format(
                              DateTime.parse(widget.flightData['date'])),
                          style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.flightData['fromTime']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Column(
                          children: [
                            Text(
                              '${widget.flightData['duration']}',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  height: 5,
                                  child: const Divider(thickness: 1.5),
                                ),
                                const Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${widget.flightData['toTime']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
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
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.flightData['departureTerminal']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '${widget.flightData['arrivalTerminal']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terminal ${widget.flightData['departureAirport']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Terminal ${widget.flightData['arrivalAirport']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.backpack,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Cabin: ${widget.flightData['baggage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.luggage,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Check-in: ${widget.flightData['baggage']}',
                          style: GoogleFonts.ubuntu(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                    '${widget.flightData['bookedByName']}',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.circle, size: 5),
                  const SizedBox(width: 5),
                  Text(
                    '${widget.flightData['bookedByEmail']}',
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
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 3),
                            child: Icon(
                              FontAwesomeIcons.map,
                              size: 14,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 3),
                            child: Icon(
                              FontAwesomeIcons.idCard,
                              size: 14,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
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
                      AdminTextFormField(
                        hintText: 'Phone no.',
                        controller: phoneController,
                        prefixIcon: FontAwesomeIcons.idCard,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Departure Terminal';
                          }
                          return null;
                        },
                      ),
                      AdminTextFormField(
                        hintText: 'Address',
                        controller: addressController,
                        prefixIcon: FontAwesomeIcons.idCard,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Departure Terminal';
                          }
                          return null;
                        },
                      )
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
}
