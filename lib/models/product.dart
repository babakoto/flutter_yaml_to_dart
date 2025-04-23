// This is an auto-generated file. Do not edit.
import 'package:equatable/equatable.dart';


class Product extends Equatable {
  final String id;
  final double price;
  final List<String> images;
  final DateTime? createdAt;

  const Product({
   required this.id,
   required this.price,
    this.images = const [],
    this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: double.parse(json['price']),
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    price,
    images,
    createdAt,
  ];
}
