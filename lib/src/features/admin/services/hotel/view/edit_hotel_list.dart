import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/image_picker/image_view.dart';
import '../controller/add_hotels_controller.dart';
import '../model/add_hotel_model.dart';

class EditHotelForm extends StatefulWidget {
  final Hotel hotel;
  const EditHotelForm({super.key, required this.hotel});
  @override
  State<EditHotelForm> createState() => _EditHotelFormState();
}

class _EditHotelFormState extends State<EditHotelForm> {
  final _hotelController = HotelController();
  final _formKey = GlobalKey<FormState>();

  late String _hotelName;
  late String _hotelType;
  late String _hotelLocation;
  late String _imgUrl;
  late int _regularHotelCost;
  late int _offeredHotelCost;
  late int _numberOfRooms;
  late double _occupancyRate;
  late double _rating;

  @override
  void initState() {
    super.initState();
    _hotelName = widget.hotel.hotelName;
    _hotelType = widget.hotel.hotelType;
    _hotelLocation = widget.hotel.location;
    _imgUrl = widget.hotel.imgUrl;
    _regularHotelCost = widget.hotel.regularHotelCost;
    _offeredHotelCost = widget.hotel.offeredHotelCost;
    _numberOfRooms = widget.hotel.numberOfRooms;
    _occupancyRate = widget.hotel.occupancyRate;
    _rating = widget.hotel.rating;
  }
///update_submit_form
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _hotelController.updateHotel(
        widget.hotel.id,
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
      Get.back();
    }
  }
///image_change_function
  Future<void> _editImage() async {
    String? newImageUrl = await _getImageFromPicker();
    if (newImageUrl != null) {
      setState(() {
        _imgUrl = newImageUrl;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Hotel',
          style: GoogleFonts.poppins(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              "Edit Hotel Details",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: _hotelName,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.business_rounded),
                iconColor: Colors.grey,
                hintText: 'Hotel Name',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the hotel name';
                }
                return null;
              },
              onSaved: (value) => _hotelName = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _hotelType,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.star),
                iconColor: Colors.grey,
                hintText: 'Hotel Type',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the hotel type';
                }
                return null;
              },
              onSaved: (value) => _hotelType = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on_outlined),
                iconColor: Colors.grey,
                hintText: 'Location',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              initialValue: _hotelLocation,
              onSaved: (value) => _hotelLocation = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _regularHotelCost.toString(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money),
                iconColor: Colors.grey,
                hintText: 'Regular cost/Day',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              onSaved: (value) => _regularHotelCost = int.parse(value!),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _offeredHotelCost.toString(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money),
                iconColor: Colors.grey,
                hintText: 'Offered cost/Day',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              onSaved: (value) => _offeredHotelCost = int.parse(value!),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _numberOfRooms.toString(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.hotel_outlined),
                iconColor: Colors.grey,
                hintText: 'Number of Rooms',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              onSaved: (value) => _numberOfRooms = int.parse(value!),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _occupancyRate.toString(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                iconColor: Colors.grey,
                hintText: 'Occupancy Rate',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              onSaved: (value) => _occupancyRate = double.parse(value!),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: _rating.toString(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.star_border_outlined),
                iconColor: Colors.grey,
                hintText: 'Rating',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),),
              onSaved: (value) => _rating = double.parse(value!),
            ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: _editImage,
                    child: ImageView(
                      onUploadSuccess: (String url) {
                        _imgUrl = url;
                      },
                    ),
                  ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Changes',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
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
Future<String?> _getImageFromPicker() async {

  // final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  // return pickedFile?.path;
  return null;
}
