import 'package:cloud_firestore/cloud_firestore.dart';

class Apparel {
  final String id;
  final String name;
  final String type;
  final String gender;

  final num price;
  final String url;

  Apparel(
      {required this.id,
      required this.gender,
      required this.type,
      required this.name,
      required this.price,
      required this.url});

  // Factory method to create an Apparel object from a Firestore document
  factory Apparel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Apparel(
        id: doc.id,
        name: data['name'],
        price: data['price'],
        type: data['type'],
        url: data['url'],
        gender: data['gender']);
  }

  // Method to convert an Apparel object to a Firestore document
  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'price': price,
      'type': type,
      'url': url,
      'gender': gender
    };
  }

  @override
  String toString() {
    return 'Apparel{id: $id, name: $name price: $price, type: $type url : $url, gender $gender},';
  }
}
