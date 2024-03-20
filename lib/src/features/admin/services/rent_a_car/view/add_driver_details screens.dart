import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/driver_controller.dart';

class AddDriverView extends StatelessWidget {
  final _driverController = DriverController();
  final _formKey = GlobalKey<FormState>();

  late String _name = '';
  late String _phoneNumber = '';
  late String _carModel = '';
  late String _carPlateNumber = '';
  late String _carColor = '';
  late String _carType = '';
  late int _nid = 0; // National ID field
  late String _drivingLicense = ''; // Driving license field

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Call the addDriver method from the controller
      await _driverController.addDriver(
        _name,
        _phoneNumber,
        _nid,
        _carModel,
        _carPlateNumber,
        _carColor,
        _carType,
        _drivingLicense,
      );

      Navigator.pop(context); // Navigate back after adding driver
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Driver'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back without adding driver
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      iconColor: Colors.grey,
                      hintText: "Name",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _name = newValue!,
                  ),
                ),

                ///phone no.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.call),
                      iconColor: Colors.grey,
                      hintText: "Phone no.",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _phoneNumber = newValue!,
                  ),
                ),

                ///car model
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.time_to_leave_outlined),
                            iconColor: Colors.grey,
                            hintText: "Car model",
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            // Adjusting the vertical padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car model';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _carModel = newValue!,
                        ),
                      ),
                    ),
                    ///Car plate number
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.time_to_leave),
                            iconColor: Colors.grey,
                            hintText: "Car plate-no.",
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            // Adjusting the vertical padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car plate number';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _carPlateNumber = newValue!,
                        ),
                      ),
                    ),
                  ],
                ),




                ///car color
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.color_lens),
                            iconColor: Colors.grey,
                            hintText: "Color",
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            // Adjusting the vertical padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car color';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _carColor = newValue!,
                        ),
                      ),
                    ),
                    ///Car type
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.type_specimen),
                            iconColor: Colors.grey,
                            hintText: "Car type",
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                            // Adjusting the vertical padding
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a car type';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _carType = newValue!,
                        ),
                      ),
                    ),
                  ],
                ),



                ///National ID
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_pin_sharp),
                      iconColor: Colors.grey,
                      hintText: "NID",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a National ID';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _nid = int.parse(newValue!),
                  ),
                ),

                ///Driving license
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.contact_page),
                      iconColor: Colors.grey,
                      hintText: "Driving license",
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      // Adjusting the vertical padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade50,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Driving License';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _drivingLicense = newValue!,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Add Driver',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
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
