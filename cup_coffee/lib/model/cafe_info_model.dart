import 'package:cloud_firestore/cloud_firestore.dart';

class CafeInfoModel {
  late final double rating;
  late final String name;
  late final GeoPoint location;
  late final String image;

  CafeInfoModel({
    required this.name,
    required this.rating,
    required this.location,
    required this.image,
  });

  factory CafeInfoModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CafeInfoModel(
      name: snapshot['name'],
      rating: snapshot['rating'],
      location: snapshot['location'],
      image: snapshot['image'],
    );
  }
}