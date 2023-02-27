import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {
// Sign in with email and password method
  Future<void> createUserWithEmailAndPassword(emailAddress, password, confirmPassword) async {
    if (verifyPassword(password, confirmPassword)) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailAddress, password: password);
        final user = credential.user;
        print(user?.email);
      } on FirebaseAuthException catch (e) {
// handle no user found error
        if (e.code == 'user-not-found') {
          print('No user found for that email.');

// handle wrong password error
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print("Passwords do not match");
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
