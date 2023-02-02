import 'package:cloud_firestore/cloud_firestore.dart';

class CafeInfoService {

  Stream<QuerySnapshot>? getCafeInfo() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref = FirebaseFirestore.instance
        .collection('records')
        .snapshots();

    return ref;
  }
}