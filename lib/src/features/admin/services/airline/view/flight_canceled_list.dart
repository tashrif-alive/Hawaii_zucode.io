import 'package:flutter/material.dart';

class FlightCanceledList extends StatefulWidget {
  const FlightCanceledList({super.key});

  @override
  State<FlightCanceledList> createState() => _FlightCanceledListState();
}

class _FlightCanceledListState extends State<FlightCanceledList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        child: const Column(
          children: [Text('approved')],
        ),
      ),
    );
  }
}
