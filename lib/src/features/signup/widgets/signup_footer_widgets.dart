import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login/view/signin_screen.dart';

class SignUpFooterWidgets extends StatelessWidget {
  const SignUpFooterWidgets({
    Key? key,
  }) : super(key: key); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15,right: 15),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade50),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/logos/google.png"),
                  const Text('Google SignIn'),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Have an account?",style: GoogleFonts.poppins(fontWeight: FontWeight.w300,),),
            TextButton(
              onPressed: () {Get.to(const LoginScreen());},
              child: const Text(
                "SignIn",
                style: TextStyle(
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
