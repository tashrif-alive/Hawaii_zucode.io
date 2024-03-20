import 'package:firebase_auth/firebase_auth.dart';

class UserLoginModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // No error, successful login
    } catch (e) {
      return e.toString(); // Return error message
    }
  }
}
