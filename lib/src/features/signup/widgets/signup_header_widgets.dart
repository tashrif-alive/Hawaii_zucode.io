import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpHeaderWidgets extends StatelessWidget {
  const SignUpHeaderWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
              height: 80,
              child: Image.asset("assets/icons/logos/hawaii_logo.png")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            "Let's Create your account..",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
      ],
    );
  }
}