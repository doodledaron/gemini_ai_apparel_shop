import 'package:cloud_firestore/cloud_firestore.dart';

class Apparel {
  final String id;
  final String name;
  final String type;
  final String size;
  final String color;
  final double price;

  Apparel({
    required this.id,
    required this.type,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
  });

  // Factory method to create an Apparel object from a Firestore document
  factory Apparel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Apparel(
      id: doc.id,
      name: data['name'],
      size: data['size'],
      color: data['color'],
      price: data['price'],
      type: data['type'],
    );
  }

  // Method to convert an Apparel object to a Firestore document
  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'size': size,
      'color': color,
      'price': price,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'Apparel{id: $id, name: $name, size: $size, color: $color, price: $price, type: $type}';
  }
}
