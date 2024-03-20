import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/bus_co_info_controller.dart';

class BusCompanyInfo extends StatefulWidget {
  const BusCompanyInfo({super.key});

  @override
  _BusCompanyInfoState createState() => _BusCompanyInfoState();
}

class _BusCompanyInfoState extends State<BusCompanyInfo> {
  final _busCompanyController = BusCompanyController();
  final _formKey = GlobalKey<FormState>();

  String _busCompany = '';
  String _address = '';
  String _departureTime = '';
  String _arrivalTime = '';
  String _duration = '';
  String _sourceLocation = '';
  String _routeDestination = '';
  String _destinationLocation = '';
  String _type = '';
  final List<String> _routes = [];

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Call the addBusCompany method from the controller
      await _busCompanyController.addBusCompany(
        _busCompany,
        _address,
        _departureTime,
        _arrivalTime,
        _duration,
        _sourceLocation,
        _routeDestination,
        _destinationLocation,
        _type,
        _routes,
      );
      _formKey.currentState!.reset();
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
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Add Bus',
          style: GoogleFonts.ubuntu(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Bus Company Name
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.directions_bus_rounded),
                    hintText: 'Bus Company',
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

              // Address
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
                onSaved: (newValue) => _address = newValue!,
              ),

              // Departure Time
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.access_time),
                  hintText: 'Departure Time',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter departure time';
                  }
                  return null;
                },
                onSaved: (newValue) => _departureTime = newValue!,
              ),

              // Arrival Time
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.access_time),
                  hintText: 'Arrival Time',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter arrival time';
                  }
                  return null;
                },
                onSaved: (newValue) => _arrivalTime = newValue!,
              ),

              // Duration
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.timer),
                  hintText: 'Duration',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter duration';
                  }
                  return null;
                },
                onSaved: (newValue) => _duration = newValue!,
              ),

              // Source Location
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Source Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter source location';
                  }
                  return null;
                },
                onSaved: (newValue) => _sourceLocation = newValue!,
              ),

              // Route Destination
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.map),
                  hintText: 'Route Destination',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter route destination';
                  }
                  return null;
                },
                onSaved: (newValue) => _routeDestination = newValue!,
              ),

              // Destination Location
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Destination Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter destination location';
                  }
                  return null;
                },
                onSaved: (newValue) => _destinationLocation = newValue!,
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

              // Type
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.info),
                  hintText: 'Type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter type';
                  }
                  return null;
                },
                onSaved: (newValue) => _type = newValue!,
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Bus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
