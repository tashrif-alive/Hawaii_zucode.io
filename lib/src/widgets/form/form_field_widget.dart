import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    required this.prefixIcon,
    required this.hintText,
    required this.fillColor,
    required this.filled,
    this.suffixIcon,
    Key? key,
    this.controller, // Make the TextEditingController nullable
  }) : super(key: key);

  final IconData prefixIcon;
  final String hintText;
  final Color fillColor;
  final bool filled;
  final IconData? suffixIcon;
  final TextEditingController? controller; // Declare the TextEditingController as nullable

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        iconColor: Colors.black54,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        // Adjusting the vertical padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}
