import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Product(
      id: doc.id,
      title: data['title']?.toString() ?? '',
      description: data['description']?.toString() ?? '',
      price: (data['price'] is num)
          ? (data['price'] as num).toDouble()
          : double.tryParse(data['price']?.toString() ?? '0') ?? 0,
      image: data['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
