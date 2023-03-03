import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/src/features/authentication/authservices/AuthExceptionHandler.dart';

class LoginService {
  // Sign in with email and password method
  Future<AuthStatus> signInWithEmailAndPassword(
      emailAddress, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      return AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      return AuthExceptionHandler.handleAuthException(e);
    }
  }

  // Sign in with Google method
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}