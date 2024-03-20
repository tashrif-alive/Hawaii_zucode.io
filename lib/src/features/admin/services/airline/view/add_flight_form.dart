import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../widgets/image_picker/image_view.dart';
import '../../../widgets/admin_textform_field.dart';
import '../controller/add_flight_controller.dart';

class FlightFormView extends StatefulWidget {
  const FlightFormView({super.key});

  @override
  _FlightFormViewState createState() => _FlightFormViewState();
}

class _FlightFormViewState extends State<FlightFormView> {
  final _flightController = FlightController();
  final _formKey = GlobalKey<FormState>();

  String _airlineName = '';
  DateTime _selectedDate = DateTime.now();
  String _fromTime = '';
  String _toTime = '';
  String _duration = '';
  String _fromPlace = '';
  String _toPlace = '';
  String _planeModel = '';
  String _baggage = '';
  String _imgUrl = '';
  String _stoppage = '';
  String _arrivalAirport = '';
  String _arrivalTerminal = '';
  String _departureAirport = '';
  String _departureTerminal = '';
  double _ourPrice = 0;
  double _regularPrice = 0;
  bool _refundable = false;
  bool _insurance = false;
  String _flightClassValue = 'Economy';

  final List<String> _flightClassOptions = [
    'Economy',
    'Business',
    'First Class'
  ];

///submit_form
  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _flightController.addFlight(
          _airlineName,
          _selectedDate.toString(),
          _fromTime,
          _toTime,
          _duration,
          _fromPlace,
          _toPlace,
          _planeModel,
          _refundable,
          _insurance,
          _baggage,
          _flightClassValue,
          _regularPrice,
          _ourPrice,
          _imgUrl,
          _stoppage,
          _arrivalAirport,
          _arrivalTerminal,
          _departureAirport,
          _departureTerminal);
      Navigator.pop(context);
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
        _selectedDate = picked; // Store the selected date
      });
    }
  }

  ///departure_time
  Future<void> _selectDepartureTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _fromTime = picked.format(context);
      });
    }
  }

  ///arrival_time
  Future<void> _selectArrivalTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _toTime = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Flight Service',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7),
                  child: Text(
                    "Add Flight",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  )),
                const SizedBox(height: 12),
                ///AirLineName & Model
                Row(
                  children: [
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Airline',
                      prefixIcon: Icons.airplane_ticket,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an airline';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _airlineName = newValue!,
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Plane Model',
                      prefixIcon: Icons.local_airport_sharp,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter plane model';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _planeModel = newValue!,
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                ///Destinations
                Row(
                  children: [
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'From',
                      prefixIcon: Icons.place_rounded,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Departure place';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _fromPlace = newValue!,
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'To',
                      prefixIcon: Icons.place_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter arrival place';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _toPlace = newValue!,
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                ///Airports & terminals
                Row(
                  children: [
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Arrival Airport',
                      prefixIcon: Icons.connecting_airports,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Arrival Airport';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _arrivalAirport = newValue!,
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Arrival Terminal',
                      prefixIcon: Icons.transit_enterexit,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter arrival terminal';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _arrivalTerminal = newValue!,
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Departure Airport',
                      prefixIcon: Icons.connecting_airports,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter departure airport';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _departureAirport = newValue!,
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Departure Terminal',
                      prefixIcon: Icons.transit_enterexit,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Departure Terminal';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _departureTerminal = newValue!,
                    )),
                  ],
                ),
                const SizedBox(height: 8),
                ///Date & Time
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
                const SizedBox(height: 8),
                ///Departure & Arrival Time
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDepartureTime(context),
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Departure Time',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            prefixIcon: const Icon(Icons.access_time),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),

                          controller: TextEditingController(text: _fromTime),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter departure time';
                            }
                            return null;
                          },
                          onSaved: (newValue) => _fromTime = newValue!,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectArrivalTime(context),
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Arrival Time',
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            prefixIcon: const Icon(Icons.access_time),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ///Duration & flight Cost
                Row(
                  children: [
                    Expanded(
                        child: AdminTextFormField(
                      hintText: 'Regular Price',
                      prefixIcon: Icons.attach_money,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter regular price';
                        }
                        return null;
                      },
                      onSaved: (newValue) =>
                          _regularPrice = double.parse(newValue!),
                    )),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AdminTextFormField(
                        hintText: 'Our price',
                        prefixIcon: Icons.attach_money,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter our price';
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            _ourPrice = double.parse(newValue!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AdminTextFormField(
                  hintText: 'Duration',
                  prefixIcon: Icons.watch_later_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter duration';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _duration = newValue!,
                ),
                const SizedBox(height: 8),
                ///Stoppage
                AdminTextFormField(
                  hintText: 'Stoppage',
                  prefixIcon: Icons.expand_circle_down,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Stoppage';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _stoppage = newValue!,
                ),
                const SizedBox(height: 8),
                ///Flight_class
                DropdownButtonFormField<String>(
                  value: _flightClassValue,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.airplane_ticket_outlined),
                    iconColor: Colors.grey,
                    hintText: "Flight Class",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                  ),
                  items: _flightClassOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _flightClassValue = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 8),
                ///Others
                AdminTextFormField(
                  hintText: 'Baggage',
                  prefixIcon: Icons.backpack,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter baggage details';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _baggage = newValue!,
                ),
                const SizedBox(height: 8),
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
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
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
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ///Upload Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ImageView(onUploadSuccess: (String url) {
                    _imgUrl = url;
                  }),
                ),
                const SizedBox(height: 8),
                /// Add Flight Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _submitForm(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add Flight',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
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
