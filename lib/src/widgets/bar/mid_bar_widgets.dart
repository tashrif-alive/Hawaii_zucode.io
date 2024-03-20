import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraServicesBarWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  const ExtraServicesBarWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox.fromSize(
          size: const Size(90, 65),
          child: InkWell(
            splashColor: Colors.grey.shade50,
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.black87,
                ),
                // const SizedBox(height: 5),
                Center(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 9),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
