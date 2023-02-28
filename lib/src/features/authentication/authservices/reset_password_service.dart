import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email)
        .then((value) => print("Password reset email sent"))
        .catchError((error) => print("Failed to send password reset email: $error"));
  }
}