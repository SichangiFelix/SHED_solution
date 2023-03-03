import 'package:firebase_auth/firebase_auth.dart';

import 'AuthExceptionHandler.dart';

class ResetPasswordService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthStatus> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      return AuthExceptionHandler.handleAuthException(e);
    }

  }
}