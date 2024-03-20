import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/menus/admin_navigation_menu.dart';
import '../../../widgets/menus/user_navigation_menu.dart';
import '../../signup/view/signup_screen.dart';
import '../controllers/admin_login_controller.dart';
import 'admin_login_screen.dart';
import '../controllers/user_login_controller.dart';
import 'user_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Get.back();
      //     },
      //     color: Colors.black, // Icon color
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.asset("assets/icons/logos/hawaii_logo.png"),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///User_Login_navigator_btn
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.355,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Builder(
                                  builder: (context) => UserLoginScreen(
                                    onLogin: (String email, String password) {
                                      UserLoginController(context)
                                          .loginUser(email, password, () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NavigationMenu(),
                                          ),
                                        );
                                      });
                                    },
                                    navigateToDummyPage: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AdminBottomBar(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:  Text('Login as User',style: GoogleFonts.ubuntu(fontSize:12)),
                        ),
                      ),
                      const SizedBox(width: 8),

                      ///Admin_Login_navigator_btn
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.355,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Builder(
                                  builder: (context) => AdminLoginScreen(
                                    // Assuming you have AdminLoginView defined
                                    onLogin: (String email, String password) {
                                      AdminLoginController(context).loginUser(
                                        email,
                                        password,
                                      ); // Use AdminLoginController
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:  Text('Login as Admin',style: GoogleFonts.ubuntu(fontSize:12),),
                        ),
                      ),
                    ],
                  ),

                  ///Signup_navigator_btn
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.blueGrey,
                          ), // Border color
                        ),
                      ),
                      child:  Text('Create a new account',style: GoogleFonts.ubuntu(fontSize:14)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,)
        ],
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
