import 'package:flutter/material.dart';

import '../models/login_model.dart';

class UserLoginController {
  final UserLoginModel _model = UserLoginModel();
  final BuildContext context;

  UserLoginController(this.context);

  void loginUser(String email, String password, Function() navigateToDummyPage) async {
    String? errorMessage = await _model.signInWithEmailAndPassword(email, password);
    if (errorMessage == null) {
      // Login successful, navigate to dummy page
      navigateToDummyPage();
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
