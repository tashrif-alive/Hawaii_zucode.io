import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/admin/services/hotel/view/select_room.dart';
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
  List<int>? roomNPersons = [1, 1, 0]; // Default values: 1 room, 1 person, 0 children

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
            : SingleChildScrollView(
          child: Column(
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
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 12, left: 16, right: 16, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Travel Details',
                      style: GoogleFonts.ubuntu(
                          fontSize: 16, fontWeight: FontWeight.w500),
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
                        Expanded(
                          child: ElevatedButton(
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: Colors.white, // Background color
      onPrimary: Colors.black, // Text color
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
    );
  }

  _buildCalendarDialogButton() {
    const dayTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    const weekendTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w600);
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
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
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
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
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
              color: Colors.grey[200], // Custom background color
              borderRadius: BorderRadius.circular(12), // Custom border radius
              border: Border.all(width: 2, color: Colors.black), // Custom border
            ),
            height: 50, // Custom height
            width: 150, // Custom width
            child: ElevatedButton(
              style: _elevatedButtonStyle(),
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
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  String formatRoomNPersonText() {
    if (roomNPersons == null) return "Select Rooms";
    return " Room${roomNPersons![0]}, Guests${roomNPersons![1]}, Children${roomNPersons![2]}, ";
  }
}
