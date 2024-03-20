import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class SignUpFormWidgets extends StatelessWidget {
  const SignUpFormWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Form(
        child: Column(
          children: [
            ///FullName
            Padding(
              padding:
              const EdgeInsets.only(top: 5.0, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.user),
                  iconColor: Colors.grey,
                  hintText: "Full name",
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                ),
              ),
            ),

            ///Email
            Padding(
              padding:
              const EdgeInsets.only(top: 5.0, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  iconColor: Colors.grey,
                  hintText: "Email",
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                ),
              ),
            ),

            ///Phone Number
            Padding(
              padding:
              const EdgeInsets.only(top: 5.0, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  iconColor: Colors.grey,
                  hintText: "Phone Number",
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                ),
              ),
            ),

            ///Password
            Padding(
              padding:
              const EdgeInsets.only(top: 5.0, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    iconColor: Colors.grey,
                    hintText: "Password",
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    suffixIcon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),

            ///Confirm_password
            Padding(
              padding:
              const EdgeInsets.only(top: 5.0, left: 8, right: 8),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    iconColor: Colors.grey,
                    hintText: "Confirm Password",
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    suffixIcon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text(
                  "Is Admin?",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     Checkbox(value: false, onChanged: (value) {}),
            //     RichText(
            //       text: TextSpan(
            //         children: [
            //           TextSpan(
            //             text: 'I agree to ',
            //             style: Theme.of(context).textTheme.bodyMedium,
            //           ),
            //           TextSpan(
            //             text: 'Privacy Policy',
            //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //               decoration: TextDecoration.underline,
            //             ),
            //             // Add onTap handler for Privacy Policy here
            //           ),
            //           TextSpan(
            //             text: ' and ',
            //             style: Theme.of(context).textTheme.bodyMedium,
            //           ),
            //           TextSpan(
            //             text: 'Terms of Use',
            //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //               decoration: TextDecoration.underline,
            //             ),
            //             // Add onTap handler for Terms of Use here
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            ///SignUp Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust border radius as needed
                    ),
                  ),
                  child: Text('SignUp'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}