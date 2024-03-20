import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminLoginModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user is an admin
      final userSnapshot = await _firestore.collection('admin').doc(userCredential.user!.uid).get();
      if (!userSnapshot.exists) {
        return 'User is not an admin';
      }

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
