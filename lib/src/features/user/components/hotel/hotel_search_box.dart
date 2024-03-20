import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/user/components/hotel/search_hotel_screen.dart';


class HotelSearchBox extends StatefulWidget {
  final ValueChanged<Map<String, String>> onSearch;

  const HotelSearchBox(
      {super.key, required this.onSearch, required String hintText});

  @override
  State<HotelSearchBox> createState() => _HotelSearchBoxState();
}

class _HotelSearchBoxState extends State<HotelSearchBox> {
  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  @override
  void dispose() {
    _hotelNameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0,right: 18),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          children: [
            TextField(
              controller: _hotelNameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.flight_takeoff),
                hintText: 'Enter Origin',
                hintStyle:
                GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w600,color:Colors.black),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     GestureDetector(
            //       onTap: () => _selectDate(context),
            //       child: InputDecorator(
            //         decoration:  InputDecoration(
            //           prefixIcon: const Icon(Icons.date_range),
            //           enabledBorder: OutlineInputBorder(
            //             borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(0),
            //               topRight: Radius.circular(0),
            //             ),
            //             borderSide: BorderSide(color: Colors.grey.shade200),
            //           ),
            //           focusedBorder: OutlineInputBorder(
            //             borderRadius: const BorderRadius.only(
            //               topLeft: Radius.circular(0),
            //               topRight: Radius.circular(0),
            //             ),
            //             borderSide: BorderSide(color: Colors.grey.shade200),
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               DateFormat("E,dMMM").format(_selectedDate),
            //               style: GoogleFonts.poppins(
            //                   fontSize: 13, fontWeight: FontWeight.w600),
            //             ),
            //             const Icon(Icons.arrow_drop_down),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final searchData = {
                    'hotelName': _hotelNameController.text,
                    'location': _locationController.text,
                    //'date': _selectedDate.toString(),
                  };
                  widget.onSearch(searchData);
                  Get.to(HotelSearchResults(searchData: searchData,));
                  print(searchData);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search, color: Colors.white70),
                    const SizedBox(width: 12,),
                    Text(
                      'Search Hotels',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
