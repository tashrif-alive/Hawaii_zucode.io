import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddServicesButtonWidgets extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const AddServicesButtonWidgets({
    required Key key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color:Colors.white)
        ),
      ),
    );
  }
}
