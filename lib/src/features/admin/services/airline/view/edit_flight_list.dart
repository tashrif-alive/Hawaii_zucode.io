import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../widgets/image_picker/image_view.dart';
import '../controller/add_flight_controller.dart';
import '../model/add_flight_model.dart';

class EditFlightForm extends StatefulWidget {
  final Flight flight;

  const EditFlightForm({super.key, required this.flight});

  @override
  _EditFlightFormState createState() => _EditFlightFormState();
}

class _EditFlightFormState extends State<EditFlightForm> {
  final _flightController = FlightController();
  final _formKey = GlobalKey<FormState>();

  late String _airlineName;
  DateTime _selectedDate = DateTime.now();
  //late String _fromTime;
  // late String _toTime;
   late String _duration;
  late String _fromPlace;
  late String _toPlace;
  late String _planeModel;
  late bool _refundable;
  late bool _insurance;
  late String _baggage;
  late String _flightClass;
  late double _regularPrice;
  late double _ourPrice;
  late String _imgUrl;
  late String _stoppage;
  late String _departureTerminal;
  late String _departureAirport;
  late String _arrivalTerminal;
  late String _arrivalAirport;

  @override
  void initState() {
    super.initState();
    _airlineName = widget.flight.airlineName;
    _selectedDate = DateTime.parse(widget.flight.date.toString());
    // _fromTime = DateTime.parse(widget.flight.fromTime.toString());
    //_toTime = DateTime.parse(widget.flight.toTime.toString());
    _duration = widget.flight.duration;
    _fromPlace = widget.flight.fromPlace;
    _toPlace = widget.flight.toPlace;
    _planeModel = widget.flight.planeModel;
    _refundable = widget.flight.refundable;
    _insurance = widget.flight.insurance;
    _baggage = widget.flight.baggage;
    _flightClass = widget.flight.flightClass;
    _regularPrice = widget.flight.regularPrice;
    _ourPrice = widget.flight.ourPrice;
    _imgUrl = widget.flight.imgUrl;
    _stoppage = widget.flight.stoppage;
    _departureTerminal = widget.flight.departureTerminal;
    _departureAirport = widget.flight.departureAirport;
    _arrivalTerminal = widget.flight.arrivalTerminal;
    _arrivalAirport = widget.flight.arrivalAirport;
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _flightController.updateFlight(
        widget.flight.id,
        _airlineName,
        _selectedDate.toString(),
        // _fromTime.toString(),
        // _toTime.toString(),
        _duration,
        _fromPlace,
        _toPlace,
        _planeModel,
        _refundable as bool,
        _insurance as bool,
        _baggage as String,
        _flightClass as String,
        _regularPrice as double,
        _ourPrice as double,
        _imgUrl as String,
        _stoppage as String,
        _departureTerminal,
        _departureAirport,
        _arrivalTerminal,
        _arrivalAirport,
      );
      Get.back();
    }
  }

  /// Method to show the date picker
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

  ///departure_time
  // Future<void> _selectDepartureTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _fromTime = picked.format(context);
  //     });
  //   }
  // }
  //
  // ///arrival_time
  // Future<void> _selectArrivalTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _toTime = picked.format(context);
  //     });
  //   }
  // }

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
          'Edit Flight',
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Text(
                "Edit Flight Details",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _airlineName,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          hintText: 'Airline Name',
                          label: const Text('Airline Name'),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _airlineName = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _planeModel,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          hintText: 'Plane model',
                          label: const Text('Plane model'),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _planeModel = value!,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _fromPlace,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.add_location_alt),
                          iconColor: Colors.grey,
                          hintText: 'Origin',
                          label: const Text('Origin'),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _fromPlace = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _toPlace,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.add_location_alt_outlined),
                          iconColor: Colors.grey,
                          hintText: 'Destination',
                          label: const Text('Destination'),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _toPlace = value!,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _arrivalTerminal,
                        decoration: InputDecoration(
                          label: const Text('ArrivalAirport'),
                          prefixIcon: const Icon(Icons.connecting_airports),
                          iconColor: Colors.grey,
                          hintText: 'ArrivalAirport',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _arrivalTerminal = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _arrivalAirport,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          hintText: 'Arrival Terminal',
                          label: const Text('Arrival Terminal'),
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _arrivalAirport = value!,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _departureTerminal,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('DepartureTerminal'),
                          hintText: 'DepartureTerminal',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _departureTerminal = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _departureAirport,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('Departure Airport'),
                          hintText: 'Departure Airport',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the Departure Airport';
                          }
                          return null;
                        },
                        onSaved: (value) => _departureAirport = value!,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _regularPrice.toString(),
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('Regular Price'),
                          hintText: 'Regular Price',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) =>
                            _regularPrice = double.parse(value!),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _ourPrice.toString(),
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('Offered Price'),
                          hintText: 'Offered Price',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the Departure Airport';
                          }
                          return null;
                        },
                        onSaved: (value) => _ourPrice = double.parse(value!),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () => _selectDepartureTime(context),
              //         child: TextFormField(
              //           initialValue: _fromTime,
              //           enabled: false,
              //           decoration: InputDecoration(
              //             hintText: 'Departure Time',
              //             hintStyle: GoogleFonts.poppins(
              //                 fontSize: 14, fontWeight: FontWeight.w400),
              //             prefixIcon: const Icon(Icons.access_time),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(8),
              //               borderSide: BorderSide.none,
              //             ),
              //             filled: true,
              //             fillColor: Colors.grey.shade50,
              //           ),
              //           controller: TextEditingController(text: _fromTime),
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return 'Please enter departure time';
              //             }
              //             return null;
              //           },
              //           onSaved: (newValue) => _fromTime = newValue!,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () => _selectArrivalTime(context),
              //         child: TextFormField(
              //           initialValue: _toTime,
              //           enabled: false,
              //           decoration: InputDecoration(
              //             hintText: 'Arrival Time',
              //             hintStyle: GoogleFonts.poppins(
              //                 fontSize: 14, fontWeight: FontWeight.w400),
              //             prefixIcon: const Icon(Icons.access_time),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(8),
              //               borderSide: BorderSide.none,
              //             ),
              //             filled: true,
              //             fillColor: Colors.grey.shade50,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _departureTerminal,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('DepartureTerminal'),
                          hintText: 'DepartureTerminal',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the airline name';
                          }
                          return null;
                        },
                        onSaved: (value) => _departureTerminal = value!,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        initialValue: _departureAirport,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.airplane_ticket_outlined),
                          iconColor: Colors.grey,
                          label: const Text('Departure Airport'),
                          hintText: 'Departure Airport',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey.shade50,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter the Departure Airport';
                          }
                          return null;
                        },
                        onSaved: (value) => _departureAirport = value!,
                      ),
                    ),
                  ),
                ],
              ),
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
                  //   ],
                  // ),

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
            ]),
          ),
        ),
      ),
    );
  }
}

Future<String?> _getImageFromPicker() async {
  //final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  // return pickedFile?.path;
  return null;
}
