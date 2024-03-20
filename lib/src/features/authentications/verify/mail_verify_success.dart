import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../forget_pass/models/forget_password_text.dart';


class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/icons/logos/verify_success.png"),
                Text(
                  "Your account successfully created!",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),

                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Welcome!Explore countless destinations and enjoy seamless travel experiences with Hawaii.",
                    textAlign: TextAlign.center, // Align text center
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                ///Success_Continue_Button
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const VerifyEmailScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
