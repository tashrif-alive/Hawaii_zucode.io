import 'package:flutter/material.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Service'),
      ),
      body: Center(
        child: Text('Hotel Service Screen'),
      ),
    );
  }
}
