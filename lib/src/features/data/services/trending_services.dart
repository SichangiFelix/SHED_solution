import 'package:cloud_firestore/cloud_firestore.dart';

import 'db_service.dart';

class TrendingServices {


  final CollectionReference trendingCollection = db.collection('trending');

  Stream<QuerySnapshot> getTrends() {
    return trendingCollection.snapshots();
  }
}