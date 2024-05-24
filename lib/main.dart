import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hawaii_beta/firebase_options.dart';
import 'package:hawaii_beta/src/widgets/menus/admin_navigation_menu.dart';
import 'package:hawaii_beta/src/widgets/menus/user_navigation_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor blackSwatch = const MaterialColor(
      0xFF000000, // The primary value
      <int, Color>{
        50: Colors.black, // You can define shades as needed
        100: Colors.black,
        200: Colors.black,
        300: Colors.black,
        400: Colors.black,
        500: Colors.black, // This is the primary color
        600: Colors.black,
        700: Colors.black,
        800: Colors.black,
        900: Colors.black,
      },
    );

    return GetMaterialApp(
      title: 'hawaii',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: blackSwatch,
      ),
      home: const AdminBottomBar(),
    );
  }
}
