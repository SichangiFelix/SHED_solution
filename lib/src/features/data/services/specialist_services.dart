import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_service.dart';

class SpecialistServices {


  final CollectionReference specialistCollection = db.collection('specialists');

  Stream<QuerySnapshot> getSpecialists() {
    return specialistCollection.snapshots();
  }
}