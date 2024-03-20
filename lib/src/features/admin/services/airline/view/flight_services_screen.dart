import 'package:flutter/material.dart';

import 'add_flight_form.dart';

class FlightScreen extends StatelessWidget {
  const FlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Service'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlightFormView(),
          ],
        ),
      ),
    );
  }
}
