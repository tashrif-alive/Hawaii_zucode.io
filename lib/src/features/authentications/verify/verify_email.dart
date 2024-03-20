import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mail_verify_success.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
                Image.asset("assets/icons/logos/verify_user.png"),
                Text(
                  "Verify your email Address!",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "test@hawaii.com",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Congratulation! Your account awaits: Verify your mail to start exploring and experience a world of unrivaled deals and offers.",
                    textAlign: TextAlign.center, // Align text center
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ///Verification_Continue_Button
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const VerifySuccessScreen());
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

                const SizedBox(height: 10),

                ///SignUp Button
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade50),
                      ),
                      child: const Text('Resend Code'),
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
