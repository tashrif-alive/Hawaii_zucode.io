import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/menus/admin_navigation_menu.dart';
import '../models/admin_model.dart';

class AdminLoginController {
  final AdminLoginModel _model = AdminLoginModel();
  final BuildContext _context;

  AdminLoginController(this._context);

  void loginUser(String email, String password) async {
    String? errorMessage = await _model.signInWithEmailAndPassword(email, password);
    if (errorMessage == null) {
      // Login successful, navigate to dummy page
      Navigator.pushReplacement(
        _context,
        MaterialPageRoute(builder: (context) => AdminBottomBar()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
