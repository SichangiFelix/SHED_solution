import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_service.dart';

class EmergencyFacilities {
  // Get all emergency facilities
  final CollectionReference emergencyFacilitiesCollection = db.collection('Emergency Facilities');

  Stream<QuerySnapshot> getEmergencyFacilities() {
    return emergencyFacilitiesCollection.snapshots();
  }
}