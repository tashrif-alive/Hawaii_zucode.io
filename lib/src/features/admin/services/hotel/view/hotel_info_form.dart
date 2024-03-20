import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/admin_textform_field.dart';
import '../controller/add_hotel_info_controller.dart';

class HotelInformationForm extends StatefulWidget {
  const HotelInformationForm({super.key});

  @override
  State<HotelInformationForm> createState() => _HotelInformationFormState();
}

class _HotelInformationFormState extends State<HotelInformationForm> {
  final _hotelInfoController = HotelInformationController();
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  late  String _location = '';
  final double _rating = 0;
  final List<String> _rooms = [];
  final List<String> _facilities = [];
  final List<String> _access = [];
  final List<String> _roomAmenities = [];
  final List<String> _safetySecurity = [];
  final List<String> _bathRoom = [];
  final List<String> _family = [];
  final List<String> _transport = [];
  final List<String> _internetServices = [];
  final List<String> _sports = [];
  final List<String> _servicesAndConveniences = [];
  final List<String> _meds = [];
  final List<String> _languages = [];

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _hotelInfoController.addHotelInformation(
        _name,
        _location,
        _rating,
        _rooms,
        _facilities,
        _access,
        _roomAmenities,
        _safetySecurity,
        _bathRoom,
        _family,
        _transport,
        _internetServices,
        _sports,
        _servicesAndConveniences,
        _meds,
        _languages,
      );
      Navigator.pop(context);
    }
  }

  Widget _buildCheckboxList(
      String title, List<String> options, List<String> selectedList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 1,
          children: options
              .map((option) => FilterChip(
                    label: Text(
                      option,
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400, fontSize: 10),
                    ),
                    selected: selectedList.contains(option),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          selectedList.add(option);
                        } else {
                          selectedList.remove(option);
                        }
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Hotel Information',
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
                  style: GoogleFonts.ubuntu(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AdminTextFormField(
                    hintText: 'Hotel Name',
                    prefixIcon: Icons.business_rounded,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the hotel name';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AdminTextFormField(
                    hintText: 'Address',
                    prefixIcon: Icons.location_on_rounded,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter the hotel name';
                      }
                      return null;
                    },
                    onSaved: (value) => _location = value!,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                ///Rooms
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: _buildCheckboxList(
                    'Rooms',
                    [
                      'Standard Room',
                      'Standard Room',
                      'Standard Room',
                      'Standard Room',
                      'Standard Room',
                      'One King Standard',
                      'One King Standard',
                      'One King Standard',
                      'One King Standard',
                      'One King Standard',
                      '2 Single Standard',
                      '2 Single Standard',
                      '2 Single Standard',
                      '2 Single Standard',
                      '2 Single Standard',
                      '2 Single Bed Standard Highway view',
                      '2 Single Bed Standard Highway view',
                      '2 Single Bed Standard Highway view',
                      '2 Single Bed Standard Highway view',
                      '2 Single Bed Standard Highway view',
                      '1 king Bed Standard Highway view',
                      '1 king Bed Standard Highway view',
                      '1 king Bed Standard Highway view',
                      '1 king Bed Standard Highway view',
                      '1 king Bed Standard Highway view',
                      '1 king Bed Premium',
                      '1 king Bed Premium',
                      '1 king Bed Premium',
                      '1 king Bed Premium',
                      '1 king Bed Premium',
                    ],
                    _facilities,
                  ),
                ),
                ///Facilities
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: _buildCheckboxList(
                    'Facilities',
                    [
                      '24*7 Check-in',
                      'Wi-fi',
                      '24*7 Room Service',
                      'Wheelchair Accessible',
                      'AC rooms',
                      'Daily housekeeping'
                    ],
                    _facilities,
                  ),
                ),

                ///Access
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: _buildCheckboxList(
                    'Access',
                    [
                      '24*7 Check-in',
                      '24*7 Front Desk',
                      'Allergy Free rooms',
                      'Non-smoking rooms',
                      'Soundproof rooms'
                    ],
                    _access,
                  ),
                ),

                ///Safety & security
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: _buildCheckboxList(
                    'Safety & security',
                    [
                      '24*7 Security',
                      'CCTV in common areas',
                      'Fire extinguisher',
                      'Safety/security feature',
                      'AC Rooms',
                      'Smoke detectors'
                    ],
                    _safetySecurity,
                  ),
                ),

                ///Room amenities
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Room amenities',
                    [
                      'Wi-fi',
                      'AC Rooms',
                      'Elevator access',
                      'Accessible toilet',
                      'Adapter',
                      'Bedside socket',
                      'Dryer for cloths',
                      'Fan',
                      'Fireplace',
                      'First Aid kit',
                      'Hand sanitiser',
                      'Ironing facilities',
                      'Linens',
                      'Marbled/tiled floor',
                      'Mirror',
                      'Satellite channels',
                      'Shelf for cloths',
                      'Soundproofing',
                      'Staircase access',
                      'Telephone',
                      'Wake-up call',
                      'Window',
                      'Wooden floor',
                    ],
                    _roomAmenities,
                  ),
                ),

                ///Bathroom
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Bathroom',
                    [
                      'Private bathroom',
                      'Shower',
                      'Toiletries',
                      'Towels',
                      'AC Rooms',
                      'Daily housekeeping'
                    ],
                    _bathRoom,
                  ),
                ),

                ///Family & Kids
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Family & Kids',
                    [
                      'Family room',
                    ],
                    _family,
                  ),
                ),

                ///Transport & transfers
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Transport & transfers',
                    [
                      'Airport transfer',
                      'Car rental service',
                      'Shuttle Service',
                      'Taxi/Cab Service',
                    ],
                    _transport,
                  ),
                ),

                ///Internet access
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Internet access',
                    [
                      'Internet services',
                    ],
                    _internetServices,
                  ),
                ),

                ///Activities & Sports
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Activities & Sports',
                    [
                      'Ticket Services',
                      'Tours',
                      'Gym',
                      'Swimming pool',
                    ],
                    _sports,
                  ),
                ),

                ///Services & conveniences
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Services & conveniences',
                    [
                      'Wheelchair-accessible',
                      'Photocopy/fax in business center',
                      'Luggage Storage',
                      'Laundry Services',
                      'ATM',
                      'Convenience Store',
                      'Currency Exchange',
                      'Dry-Cleaning',
                      'Food Delivery',
                      'Invoices Provided',
                      'Postal Services',
                      'Salon',
                      'Smoke-Free Property',
                      'AC in Public Area',
                      'Elevator access',
                    ],
                    _servicesAndConveniences,
                  ),
                ),

                ///Safety & Cleanliness
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Safety & Cleanliness',
                    [
                      'Anti-Viral Cleaning Items',
                      'Body Thermometer',
                      'Breakfast Takeaway Services',
                      'Cashless payment services',
                      'Common Area Disinfection',
                      'Doctor/Nurse on Call',
                      'Free Face Musks',
                      'Hot water linen & washing laundry',
                      'Mask Wearing Staff',
                      'Non shared stationary',
                      'Protective screens',
                      'Regular Sanitization of Room',
                      'Room services app',
                      'Safe Dining Space',
                      'Temperature Check',
                      'First Aid Kit',
                      'Hand Sanitiser',
                    ],
                    _meds,
                  ),
                ),

                ///Languages
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: _buildCheckboxList(
                    'Languages',
                    [
                      'Bengali',
                      'English',
                    ],
                    _languages,
                  ),
                ),
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
                      'Add Hotel Information',
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
