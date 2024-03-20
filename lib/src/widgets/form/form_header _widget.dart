import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    required this.image,
    this.height,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  final String image, title, subtitle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Text(
          subtitle,
          style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }
}
