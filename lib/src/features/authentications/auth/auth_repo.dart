import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../signup/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(AppUser user) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      User firebaseUser = userCredential.user!;
      String uid = firebaseUser.uid;

      // Set display name
      await firebaseUser.updateDisplayName(user.name);
      await firebaseUser.reload();
      firebaseUser = _firebaseAuth.currentUser!;

      // Determine the collection based on isAdmin value
      String collectionName = user.isAdmin == true ? 'admin' : 'users';

      // Store user data in Firestore
      await _firestore.collection(collectionName).doc(uid).set({
        'name': user.name,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'isAdmin': user.isAdmin,
        'password': user.password,
      });
    } catch (e) {
      throw e;
    }
  }
}
