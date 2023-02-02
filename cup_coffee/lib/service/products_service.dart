import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsService {

  Stream<QuerySnapshot>? getAsleyCafeProductsInfo() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref = FirebaseFirestore.instance
        .collection('Asley Cafe')
        .snapshots();

    return ref;
  }
  Stream<QuerySnapshot>? getBunnyCafeProductsInfo() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref = FirebaseFirestore.instance
        .collection('Bunny Cafe')
        .snapshots();

    return ref;
  }
  Stream<QuerySnapshot>? getOldTownCafeProductsInfo() {
    Stream<QuerySnapshot<Map<String, dynamic>>> ref = FirebaseFirestore.instance
        .collection('Old Town Cafe')
        .snapshots();

    return ref;
  }
}