// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';


class Product extends Equatable {
  final String id;
  final double price;
  final String? description;
  final List<int> counts;
  final List<String> images;
  final DateTime? createdAt;

  const Product({
    required this.id,
    this.price = 0.0,
    this.description,
    this.counts = const [],
    this.images = const [],
    this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: double.parse(json['price']),
      description: json['description'],
      counts: json['counts'] != null ? List<int>.from(json['counts']) : [],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    price,
    description,
    counts,
    images,
    createdAt,
  ];
}
