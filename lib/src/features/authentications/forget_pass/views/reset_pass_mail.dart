import 'package:flutter/material.dart';
import '../../../../widgets/form/form_field_widget.dart';
import '../../../../widgets/form/form_header _widget.dart';
import '../../../login/view/signin_screen.dart';

class ResetPasswordMailScreen extends StatelessWidget {
  const ResetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: FormHeaderWidget(
                  image: 'assets/icons/logos/forget.png',
                  title: "Forget Pasword",
                  subtitle: "Verify with E-mail to reset your password",
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: FormFieldWidget(
                      prefixIcon: Icons.email_outlined,
                      hintText: 'Email',
                      fillColor: Colors.white60,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Text("Continue"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      child: Text("Back"),
                    ),
                  ),
                ],
              ),

              // ButtonWidget(
              //   title: 'Back',
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const LoginScreen(),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
