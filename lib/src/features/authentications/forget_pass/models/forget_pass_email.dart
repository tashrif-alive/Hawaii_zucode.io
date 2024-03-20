import 'package:flutter/material.dart';
import '../../../../widgets/form/form_field_widget.dart';
import '../../../../widgets/form/form_header _widget.dart';


class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const FormHeaderWidget(
                image: 'assets/icons/logos/forget.png',
                title: "Forget Password",
                subtitle: "Verify with E-mail to reset your password",
              ),
              const SizedBox(
                height: 40,
              ),
              const FormFieldWidget(
                prefixIcon: Icons.email_outlined,
                hintText: 'Email',
                fillColor: Colors.white60,
                filled: true,
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
                  onPressed: () {},
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
        ),
      ),
    );
  }
}
