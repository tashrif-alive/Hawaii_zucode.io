import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const AdminTextFormField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        iconColor: Colors.grey,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
