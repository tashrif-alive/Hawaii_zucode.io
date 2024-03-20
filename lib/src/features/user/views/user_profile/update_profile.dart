import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateUserProfile extends StatelessWidget {
  const UpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Account",
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Photo",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
              ),
            ),
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey.shade900),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                    shape: BoxShape.rectangle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/icons/logos/user.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Upload Photo',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),

          ],
        ),
      ),
    );
  }
}
