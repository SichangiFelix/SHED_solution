import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessagingService{
  static void updateAvailability(){
    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;

    final data = {
      'name': _auth.currentUser!.displayName ?? _auth.currentUser!.email,
      'email': _auth.currentUser!.email,
      'date': DateTime.now(),
    };

    try {
      _firestore.collection('users').doc(_auth.currentUser!.uid).set(data);
    } catch (e) {
      print(e);
    }
  }
}