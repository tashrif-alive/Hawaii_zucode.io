import 'package:flutter/material.dart';

class AdminLoginFooter extends StatelessWidget {
  const AdminLoginFooter({
    Key? key,
  }) : super(key: key); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 15),
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
    );
  }
}
