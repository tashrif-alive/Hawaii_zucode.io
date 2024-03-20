// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../../../widgets/image_picker/image_view.dart';
// import '../controller/add_flight_controller.dart';
// import '../model/airline_info_model.dart';
//
// class EditAirlineForm extends StatefulWidget {
//   final Airline airline;
//
//   const EditAirlineForm({super.key, required this.airline});
//
//   @override
//   _EditAirlineFormState createState() => _EditAirlineFormState();
// }
//
// class _EditAirlineFormState extends State<EditAirlineForm> {
//   final _flightController = FlightController();
//   final _formKey = GlobalKey<FormState>();
//
//   late String _airline;
//   late String _airplaneModel;
//   late String _address;
//   late String _facilities;
//   late String _imgUrl;
//   late List<String> _routes;
//   late bool _refundable;
//   late bool _insurance;
//
//   @override
//   void initState() {
//     super.initState();
//     _airline = widget.airline.airline;
//     _airplaneModel = widget.airline.airplaneModel;
//     _address = widget.airline.address;
//     _facilities = widget.airline.facilities;
//     _imgUrl = widget.airline.imgUrl;
//     _routes = widget.airline.routes;
//     _refundable = widget.airline.refundable;
//     _insurance = widget.airline.insurance;
//   }
//
//   void _submitForm(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       await _flightController.updateFlight(
//           widget.airline.id,
//           _airline,
//           _airplaneModel,
//           _address,
//           _imgUrl,
//           _facilities,
//           _routes,
//           _refundable,
//           _insurance
//       );
//       Get.back();
//     }
//   }
//
//   Future<void> _editImage() async {
//     String? newImageUrl = await _getImageFromPicker();
//     if (newImageUrl != null) {
//       setState(() {
//         _imgUrl = newImageUrl;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Edit Airline Info',
//           style: GoogleFonts.ubuntu(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Edit Flight Details",
//                   style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   initialValue: _airline,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.airplane_ticket_outlined),
//                     hintText: 'Airline Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter the airline name';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _airline = value!,
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   initialValue: _airplaneModel,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.airplane_ticket_outlined),
//                     hintText: 'Plane Model',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter the plane model';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _airplaneModel = value!,
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   initialValue: _address,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.airplane_ticket_outlined),
//                     hintText: 'Address',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter the address';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _address = value!,
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   initialValue: _facilities,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.airplane_ticket_outlined),
//                     hintText: 'Facilities',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter the facilities';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _facilities = value!,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: GestureDetector(
//                     onTap: _editImage,
//                     child: ImageView(
//                       onUploadSuccess: (String url) {
//                         _imgUrl = url;
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   initialValue: _routes,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.airplane_ticket_outlined),
//                     hintText: 'Routes',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter the routes';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _routes = value!,
//                 ),
//                 const SizedBox(height: 10),
//                 SwitchListTile(
//                   title: const Text('Refundable'),
//                   value: _refundable,
//                   onChanged: (value) {
//                     setState(() {
//                       _refundable = value;
//                     });
//                   },
//                 ),
//                 SwitchListTile(
//                   title: const Text('Insurance'),
//                   value: _insurance,
//                   onChanged: (value) {
//                     setState(() {
//                       _insurance = value;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () => _submitForm(context),
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<String?> _getImageFromPicker() async {
//   //final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
//   // return pickedFile?.path;
//   return null;
// }
