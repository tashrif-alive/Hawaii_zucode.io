import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/admin/services/airline/view/check_box_list_widget.dart';
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
  final TextEditingController _air = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _airPlaneModelController =
      TextEditingController();
  final TextEditingController _bagController = TextEditingController();
  String _airline = '';
  String _address = '';
  late String _airPlaneModel = '';
  String _imgUrl = '';
  String _facilities = '';
  final List<String> _routes = [];
  bool _refundable = false;
  bool _insurance = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await _airlineController.addAirline(
        _air.text,
        _addressController.text,
        _airPlaneModelController.text,
        // _airline,
        // _address,
        // _airPlaneModel,
        _imgUrl,
        _bagController.text,
        // _facilities,
        _routes,
        _refundable,
        _insurance,
      );
      Navigator.pop(context);
    }
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
                        controller: _air,
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
                        controller: _airPlaneModelController,
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
                  controller: _addressController,
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
                  controller: _bagController,
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
                child: CheckBoxListWidget(
                  title: 'Routes',
                  options: AppCities.routes,
                  selectedList: _routes,
                  onSelected: (isSelected, option) {
                    setState(() {
                      if (isSelected) {
                        _routes.add(option);
                      } else {
                        _routes.remove(option);
                      }
                    });
                  },
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
