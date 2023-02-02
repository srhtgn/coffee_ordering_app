import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  late final double rating;
  late final double price;
  late final double time;
  late final String name;
  late final String image;

  ProductsModel({
    required this.name,
    required this.rating,
    required this.price,
    required this.time,
    required this.image,
  });

  factory ProductsModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ProductsModel(
      name: snapshot['name'],
      rating: snapshot['rating'],
      price: snapshot['price'],
      time: snapshot['time'],
      image: snapshot['image'],
    );
  }
}