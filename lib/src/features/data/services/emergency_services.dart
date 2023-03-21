import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_service.dart';
class EmergencyServices{


  // Get all emergency situations
  final CollectionReference emergencyCollection = db.collection('Emergency Situations');

  Stream<QuerySnapshot> getEmergencySituations() {
    return emergencyCollection.snapshots();
  }

}