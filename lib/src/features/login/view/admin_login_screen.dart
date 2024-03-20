import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../signup/view/signup_screen.dart';
import '../../authentications/forget_pass/views/forget_pass_screen.dart';
import '../widgets/admin_signin_footer_widgets.dart';
import '../widgets/admin_signin_header_widgets.dart';

class AdminLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Function(String, String) onLogin;

  AdminLoginScreen({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Admin Login')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45.0,
            bottom: 5,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///----------Header-----------///
              const AdminLoginHeader(),
              const SizedBox(height: 40),
              ///---------------LoginForm-----------------///
              ///Email
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outlined),
                  iconColor: Colors.grey,
                  hintText: "Email",
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  // Adjusting the vertical padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              ///Password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outlined),

                  iconColor: Colors.black54,
                  hintText: "Password",
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  // Adjusting the vertical padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Remember_me
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text("Remember me"),
                    ],
                  ),
                  ///Forget Password Button
                  TextButton(
                    onPressed: () {
                      ForgetPassScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ///SignIn Button
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      onLogin(emailController.text, passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('SignIn'),
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
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey.shade50),
                    ),
                    child: const Text('Create a new account'),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ///----------Divider-----------///
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: const Divider(thickness: 1.4),
                  ),
                  const Text("Or continue with"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: const Divider(thickness: 1.4),
                  ),
                ],
              ),
              ///----------Footer-----------///
              const AdminLoginFooter()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        mini: true,
        backgroundColor: Colors.grey.shade50,
        elevation: 0.0,
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
          size: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
