import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/admin/services/hotel/view/select_room.dart';
import 'package:hawaii_beta/src/features/user/components/hotel/booking_review.dart';
import 'package:intl/intl.dart';

import 'hotel_facilities_veiw.dart';

class HotelDetailAdmin extends StatefulWidget {
  final Map<String, dynamic> data;

  const HotelDetailAdmin({Key? key, required this.data}) : super(key: key);

  @override
  State<HotelDetailAdmin> createState() => _HotelDetailAdminState();
}

class _HotelDetailAdminState extends State<HotelDetailAdmin> {
  Map<String, dynamic>? hotelData;
  bool isLoading = true;

  List<DateTime?> _dialogCalendarPickerValue = [];
  List<int>? roomNPersons = [1, 1, 0];

  int get nightCount {
    if (_dialogCalendarPickerValue.length < 2) return 1;
    DateTime checkInDateTime = _dialogCalendarPickerValue[0]!;
    DateTime checkOutDateTime = _dialogCalendarPickerValue[1]!;
    Duration duration = checkOutDateTime.difference(checkInDateTime);
    int nc = duration.inDays;
    if (nc < 1) nc = 1;
    return nc;
  }

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
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('hotelInformation').where('location', isEqualTo: model).get();

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
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Starting From',
                      style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(
                        children: [
                          Text(
                            '\$${widget.data['offeredHotelCost'] * nightCount * (roomNPersons?[0] ?? 1)}',
                            style: GoogleFonts.ubuntu(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${widget.data['regularHotelCost'] * nightCount * (roomNPersons?[0] ?? 1)}',
                            style: GoogleFonts.ubuntu(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              // Add line-through effect
                              decorationColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    //await processHotelBooking();
                    Get.snackbar("Success", "Payment Completed, Your Seat is Reserved");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Sets a border radius of 20
                    ), // Button padding
                  ),
                  child: Text("Continue", style: GoogleFonts.ubuntu()),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                        child: Image.network(
                          widget.data['imgUrl'] ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${widget.data['hotelName']}',
                                    style: GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.circle,
                                    size: 5,
                                  ),
                                  const SizedBox(width: 5),
                                  Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Icon(
                                          i < widget.data['rating'] ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                          size: 18,
                                        )
                                    ],
                                  )
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
                                          style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w400)),
                                      Text('${hotelData?['address'] ?? ''}',
                                          style: GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w300)),
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
                                              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue),
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
                                                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.blue),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            '23 Ratings',
                                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.w300, fontSize: 13),
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
                        Container(height: 8, color: Colors.blueGrey.shade50),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Travel Details',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: _buildCalendarDialogButton(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomAlertDialog();
                                            },
                                          ).then((value) {
                                            if (value != null) {
                                              print('Returned values: $value');
                                              setState(() {
                                                roomNPersons = value;
                                              });
                                            }
                                          });
                                        },
                                        child: Text(formatRoomNPersonText()),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(height: 8, color: Colors.blueGrey.shade50),
                        Container(
                          padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Facilities',
                                style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              facilityGridView((hotelData?['facilities'] as List<dynamic>?)?.cast<String>() ?? [])
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(height: 8, color: Colors.blueGrey.shade50),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'House Rules and Policy',
                            style: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Check-in: 13:00',
                                style: GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Check-out: 11:00',
                                style: GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (kDebugMode) {
                                  print("Here is the date $_dialogCalendarPickerValue");
                                }
                                final updatedData = {
                                  ...widget.data,
                                };
                                Get.to(() => BookingReviewHotel(
                                      data: updatedData,
                                      rooms: roomNPersons,
                                      dates: _dialogCalendarPickerValue ?? [],
                                      price:
                                          '\$${widget.data['offeredHotelCost'] * nightCount * (roomNPersons?[0] ?? 1)}',
                                      hotelData: hotelData,
                                      nightCount: nightCount,
                                    ));
                              },
                              child: Text("Continue",
                                  style: GoogleFonts.ubuntu(fontSize: 13, fontWeight: FontWeight.w400)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  _buildCalendarDialogButton() {
    const dayTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    const weekendTextStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
      selectableDayPredicate: (day) => !day.isBefore(DateTime.now()),
      calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true ? Colors.white : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            height: 50, // Custom height
            width: 150, // Custom width
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                final values = await showCalendarDatePicker2Dialog(
                  context: context,
                  config: config,
                  dialogSize: const Size(325, 400),
                  borderRadius: BorderRadius.circular(15),
                  value: _dialogCalendarPickerValue,
                  dialogBackgroundColor: Colors.white,
                );
                if (values != null) {
                  // ignore: avoid_print
                  print(_getValueText(
                    config.calendarType,
                    values,
                  ));
                  setState(() {
                    _dialogCalendarPickerValue = values;
                  });
                }
              },
              child: Text(formatSelectedDateRange(_dialogCalendarPickerValue)),
            ),
          ),
        ],
      ),
    );
  }

  String formatSelectedDateRange(List<DateTime?> selectedDates) {
    final formatter = DateFormat('d MMM');

    if (selectedDates.length != 2 || selectedDates.contains(null)) {
      // If no dates are selected, show the present date
      final currentDate = DateTime.now();
      final formattedCurrentDate = formatter.format(currentDate);
      return formattedCurrentDate;
    } else {
      // Format the selected dates
      final startDate = selectedDates[0]!;
      final endDate = selectedDates[1]!;
      final formattedStartDate = formatter.format(startDate);
      final formattedEndDate = formatter.format(endDate);

      // Return the formatted date range
      return '$formattedStartDate - $formattedEndDate';
    }
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values = values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null).toString().replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText =
          values.isNotEmpty ? values.map((v) => v.toString().replaceAll('00:00:00.000', '')).join(', ') : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1 ? values[1].toString().replaceAll('00:00:00.000', '') : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  String formatRoomNPersonText() {
    if (roomNPersons == null) return "Select Rooms";

    List<String> parts = [];

    if (roomNPersons![0] > 0) {
      parts.add("Room${roomNPersons![0]}");
    }
    if (roomNPersons![1] > 0) {
      parts.add("Guests${roomNPersons![1]}");
    }
    if (roomNPersons![2] > 0) {
      parts.add("Children${roomNPersons![2]}");
    }

    return parts.isNotEmpty ? parts.join(", ") : "Select Rooms";
  }

  Icon getFacilityIcon(String facility) {
    switch (facility.toLowerCase()) {
      case '24*7 room service':
        return const Icon(Icons.room_service, size: 18);
      case 'wi-fi':
        return const Icon(Icons.wifi, size: 18);
      case '24*7 check-in':
        return const Icon(Icons.home_mini, size: 18);
      case 'ac rooms':
        return const Icon(Icons.ac_unit, size: 18);
      case 'daily housekeeping':
        return const Icon(Icons.cleaning_services, size: 18);
      case 'wheelchair accessible':
        return const Icon(Icons.wheelchair_pickup, size: 18);

      default:
        return const Icon(Icons.help_outline);
    }
  }

  Widget facilityGridView(List<String> facilities) {
    final displayedFacilities = facilities.length > 6 ? facilities.sublist(0, 6) : facilities;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        mainAxisExtent: 80,
      ),
      itemCount: displayedFacilities.length,
      itemBuilder: (context, index) {
        if (index == 5) {
          return GestureDetector(
            onTap: () {
              HotelFacilitiesScreen.buildShowModalBottomSheet(context, hotelData!);
            },
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+${facilities.length}',
                      style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8.0),
                    Text('Facilities', style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
          );
        }
        final facility = displayedFacilities[index];
        return Material(
          elevation: 1,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getFacilityIcon(facility),
                const SizedBox(height: 8.0),
                Text(
                  facility,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
