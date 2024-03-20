import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/image_picker/image_view.dart';
import '../../../widgets/admin_textform_field.dart';
import '../controller/airline_info_controller.dart';

class AirlineInfoUpload extends StatefulWidget {
  const AirlineInfoUpload({super.key});

  @override
  _AirlineInfoUploadState createState() => _AirlineInfoUploadState();
}

class _AirlineInfoUploadState extends State<AirlineInfoUpload> {
  final _airlineController = AirlineController();
  final _formKey = GlobalKey<FormState>();

  String _airline = '';
  String _address = '';
  String _airPlaneModel = '';
  String _imgUrl = '';
  String _facilities = '';
  final List<String> _routes = [];
  bool _refundable = false;
  bool _insurance = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _airlineController.addAirline(
        _airline,
        _address,
        _airPlaneModel,
        _imgUrl,
        _facilities,
        _routes,
        _refundable,
        _insurance,
      );
      Navigator.pop(context);
    }
  }

  Widget _buildCheckboxList(
    String title,
    List<String> options,
    List<String> selectedList,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 6,
          runSpacing: 1,
          children: options
              .map((option) => FilterChip(
                    label: Text(
                      option,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Airline Info.',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: AdminTextFormField(
                        hintText: 'Airline',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter airline';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _airline = newValue!,
                        prefixIcon: Icons.flight,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: AdminTextFormField(
                        hintText: 'Plane Model',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter plane model';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _airPlaneModel = newValue!,
                        prefixIcon: Icons.airplane_ticket,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AdminTextFormField(
                  hintText: 'Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _address = newValue!,
                  prefixIcon: Icons.location_on_rounded,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  child: Text(
                    "Upload Airline logo",
                    style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ImageView(
                  onUploadSuccess: (String url) {
                    setState(() {
                      _imgUrl = url;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AdminTextFormField(
                  hintText: 'Baggage',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter baggage';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _facilities = newValue!,
                  prefixIcon: Icons.backpack,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5,
                ),
                child: _buildCheckboxList(
                  'Routes',
                  [
                    'Dhaka',
                    'Chittagong',
                    'Rajshahi',
                    'Khulna',
                    'Barisal',
                    'Sylhet',
                    'Rangpur',
                    'Mymensingh',
                    'Comilla',
                    'Noakhali',
                    'Jessore',
                    'Feni',
                    'Bogura',
                    'Narayanganj',
                    'Dinajpur',
                    'Tangail',
                    'Jamalpur',
                    'Pabna',
                    'Gazipur',
                    'Kushtia',
                    'Faridpur',
                    'Brahmanbaria',
                    'Cumilla',
                    'Coxs Bazaar',
                    'Pirojpur',
                    'Patuakhali',
                    'Bhola',
                    'Joypurhat',
                    'Naogaon',
                    'Magura',
                    'Chuadanga',
                    'Satkhira',
                    'Jhenaidah',
                    'Narsingdi',
                    'Chandpur',
                    'Manikganj',
                    'Sunamganj',
                    'Habiganj',
                    'Moulvibazar',
                    'Kurigram',
                    'Lalmonirhat',
                    'Nilphamari',
                    'Thakurgaon',
                    'Gaibandha',
                    'Meherpur',
                    'Narail',
                    'Gopalganj',
                    'Shariatpur',
                    'Madaripur',
                    'Rajbari',
                    'Munshiganj',
                    'Sherpur',
                    'Netrakona',
                    'Sunamganj',
                    'Habiganj',
                    'Moulvibazar',
                    'Kurigram',
                    'Lalmonirhat',
                    'Nilphamari',
                    'Thakurgaon',
                    'Gaibandha',
                    'Meherpur',
                    'Narail',
                    'Gopalganj'
                  ],
                  _routes,
                ),
              ),

              /// Checkbox for Refundable
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _refundable,
                          onChanged: (value) {
                            setState(() {
                              _refundable = value!;
                            });
                          },
                        ),
                        Text('Refundable',
                            style: GoogleFonts.ubuntu(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          value: _insurance,
                          onChanged: (value) {
                            setState(() {
                              _insurance = value!;
                            });
                          },
                        ),
                        Text('Insurance',
                            style: GoogleFonts.ubuntu(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add Airline',
                  style: GoogleFonts.ubuntu(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
