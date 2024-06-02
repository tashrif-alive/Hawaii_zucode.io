import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/image_picker/image_view.dart';
import '../../../widgets/admin_textform_field.dart';
import '../controller/add_hotels_controller.dart';

class AddHotelForm extends StatefulWidget {
  const AddHotelForm({super.key});

  @override
  State<AddHotelForm> createState() => _AddHotelFormState();
}

class _AddHotelFormState extends State<AddHotelForm> {
  final _hotelController = HotelController();
  final _formKey = GlobalKey<FormState>();
  double _userRating = 3.0;
  String _hotelName = '';
  String _hotelType = '';
  String _hotelLocation = '';
  String _imgUrl = '';
  int _regularHotelCost = 0;
  int _offeredHotelCost = 0;
  int _numberOfRooms = 0;
  double _occupancyRate = 0;
  double _rating = 0;

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _hotelController.addHotel(
        _hotelName,
        _hotelType,
        _hotelLocation,
        _imgUrl,
        _regularHotelCost,
        _offeredHotelCost,
        _numberOfRooms,
        _occupancyRate,
        _rating,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text('Add Hotel', style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hotel Details",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                AdminTextFormField(
                  hintText: 'Hotel Name',
                  prefixIcon: Icons.business_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the hotel name';
                    }
                    return null;
                  },
                  onSaved: (value) => _hotelName = value!,
                ),
                const SizedBox(height: 10),
            RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Icon(Icons.star),
                half: Icon(Icons.star),
                empty: Icon(Icons.star_border),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                _rating = rating;
                print(_rating);
              },
            ),
                AdminTextFormField(
                  hintText: 'Hotel Type',
                  prefixIcon: Icons.reviews_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the hotel type';
                    }
                    return null;
                  },
                  onSaved: (value) => _hotelType = value!,
                ),
                const SizedBox(height: 10),
                AdminTextFormField(
                  hintText: 'Location',
                  prefixIcon: Icons.location_on_rounded,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the hotel location';
                    }
                    return null;
                  },
                  onSaved: (value) => _hotelLocation = value!,
                ),
                const SizedBox(height: 10),
                AdminTextFormField(
                  hintText: 'Regular cost/Day',
                  prefixIcon: Icons.attach_money,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the regular cost';
                    }
                    return null;
                  },
                  onSaved: (value) => _regularHotelCost = int.parse(value!),
                ),
                const SizedBox(height: 10),
                AdminTextFormField(
                  hintText: 'Offered cost/Day',
                  prefixIcon: Icons.attach_money,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter the hotel cost';
                    }
                    return null;
                  },
                  onSaved: (value) => _offeredHotelCost = int.parse(value!),
                ),
                const SizedBox(height: 10),
                AdminTextFormField(
                  hintText: 'Number of Rooms',
                  prefixIcon: Icons.hotel_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter number of rooms';
                    }
                    return null;
                  },
                  onSaved: (value) => _numberOfRooms = int.parse(value!),
                ),
                const SizedBox(height: 10),
                AdminTextFormField(
                  hintText: 'Occupancy Rate',
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter Occupancy Rate';
                    }
                    return null;
                  },
                  onSaved: (value) => _occupancyRate = double.parse(value!),
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageView(onUploadSuccess: (String url) {
                    _imgUrl = url;
                  }),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _submitForm(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Add Hotel',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
