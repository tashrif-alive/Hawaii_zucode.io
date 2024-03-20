import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawaii_beta/src/features/authentications/forget_pass/views/reset_pass_mail.dart';
import '../models/forget_password_text.dart';
import '../widgets/forget_pass_btn_widgets.dart';

class ForgetPassScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20))),
      builder: (context) => Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                radius: 35,
                child: const Icon(
                  Icons.lock_rounded,
                  size: 45,
                  color: Colors.black87,
                ),
              ),
            ),
            Text(
              'Trouble i login?',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 13),
            ),
            Text('Choose one to reset your password',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, fontSize: 12)),
            const SizedBox(
              height: 30,
            ),
            ForgetPassBtnWidgets(
              buttonIcon: Icons.email,
              title: 'Email',
              subtitle: 'Reset via mail verification',
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ResetPasswordMailScreen());
              },
            ),
            const SizedBox(height: 10),
            ForgetPassBtnWidgets(
              buttonIcon: Icons.phone_android_outlined,
              title: 'Phone',
              subtitle: 'Reset via text message',
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const VerifyEmailScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}