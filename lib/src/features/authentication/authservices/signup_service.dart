import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/src/features/authentication/authservices/AuthExceptionHandler.dart';

class SignUpService {
// Sign in with email and password method
  Future<AuthStatus> createUserWithEmailAndPassword(emailAddress, password, confirmPassword) async {
    try {
      if (verifyPassword(password, confirmPassword)) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddress, password: password);
        return AuthStatus.successful;
      } else {
        return AuthStatus.passwordsDoNotMatch;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return AuthExceptionHandler.handleAuthException(e);
    }
  }

  bool verifyPassword(password, confirmPassword) {
    if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }
}
