import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import '../../login/view/signin_screen.dart';
import '../controllers/signup_controller.dart';
import '../widgets/signup_footer_widgets.dart';
import '../widgets/signup_header_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController controller = SignUpController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       // bottomNavigationBar:  const SignUpFooterWidgets(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 35.0,
              bottom: 5,
              left: 15,
              right: 15,
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///----------Header-----------///
                const SignUpHeaderWidgets(),
                const SizedBox(height: 40),
                ///---------------LoginForm-----------------///
                Container(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Column(
                    children: [
                      ///Full name
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: nameController,
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
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: emailController,
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
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: phoneNumberController,
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
                          keyboardType: TextInputType.phone,
                        ),
                      ),

                      ///Password
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: passwordController,
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
                          obscureText: true,
                        ),
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: isAdmin,
                            onChanged: (value) {
                              setState(() {
                                isAdmin = value!;
                              });
                            },
                          ),
                          const Text('Is Admin?'),
                        ],
                      ),

                      ///SignUp Button
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.signUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phoneNumberController.text,
                                isAdmin: isAdmin,
                              );
                              Get.offAll (()=>  const LoginScreen());
                            },
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
                const SizedBox(
                  height: 45,
                ),

                ///Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Divider(thickness: 1.4),
                    ),
                    const Text("Or continue with"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Divider(thickness: 1.4),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ///----------Footer-----------///
                const SignUpFooterWidgets()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
