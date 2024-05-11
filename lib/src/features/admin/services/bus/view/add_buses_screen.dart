import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controller/add_bus_controller.dart';

class AddBusView extends StatefulWidget {
  @override
  _AddBusViewState createState() => _AddBusViewState();
}

class _AddBusViewState extends State<AddBusView> {
  final _busController = BusController();
  final _formKey = GlobalKey<FormState>();

  String _busCompany = '';
  DateTime _selectedDate = DateTime.now();
  String _departureTime = '';
  String _arrivalTime = '';
   String _duration = '';
  String _sourceLocation = '';
  String _routeDestination = '';
  String _destinationLocation = '';
  String _type = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Call the addBus method from the controller
      await _busController.addBus(
        _busCompany,
          _selectedDate.toString(),
        _departureTime,
        _arrivalTime,
        _duration,
        _sourceLocation,
        _routeDestination,
        _destinationLocation,
        _type
      );
      _formKey.currentState!.reset();
    }
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
        _selectedDate = picked; // Store the selected date
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Bus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ///BusCompanyName
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.directions_bus_rounded),
                    iconColor: Colors.grey,
                    hintText: "Bus Company",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter bus company';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _busCompany = newValue!,
                ),
              ),

              ///Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.date_range),
                        labelText: 'Arrival Date',
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //DateFormat('yyyy-MM-dd').format(_selectedDate),
                            DateFormat("E,dMMM").format(_selectedDate),
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ///Type
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.type_specimen),
                    iconColor: Colors.grey,
                    hintText: "Type",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter type';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _type = newValue!,
                ),
              ),
              ///DepartureTime
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.access_time),
                    iconColor: Colors.grey,
                    hintText: "DepartureTime",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter DepartureTime';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _departureTime = newValue!,
                ),
              ),
              ///ArrivalTime
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.access_time),
                    iconColor: Colors.grey,
                    hintText: "ArrivalTime",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter ArrivalTime';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _arrivalTime = newValue!,
                ),
              ),
              ///Duration
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.timer_outlined),
                    iconColor: Colors.grey,
                    hintText: "Duration",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter Duration';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _duration = newValue!,
                ),
              ),
              ///sourceLocation
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    iconColor: Colors.grey,
                    hintText: "Source Location",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter Source Location';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _sourceLocation = newValue!,
                ),
              ),
              ///RouteDestination
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.map),
                    iconColor: Colors.grey,
                    hintText: "Route",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter Route';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _routeDestination = newValue!,
                ),
              ),
              ///DestinationLocation
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    iconColor: Colors.grey,
                    hintText: "DestinationLocation",
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                      return 'Please enter DestinationLocation';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _destinationLocation = newValue!,
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Bus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
