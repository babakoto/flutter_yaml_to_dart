// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';


class Product extends Equatable {
  final String id;
  final double? price;
  final String? description;
  final List<int> counts;
  final List<String> images;
  final DateTime? createdAt;

  const Product({
    required this.id,
    this.price,
    this.description,
    this.counts = const [],
    this.images = const [],
    this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'description': description,
      'counts': counts,
      'images': images,
      'created_at': createdAt,
    };
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'] != null ? double.parse(json['price']) : null,
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

  Product copyWith({
    String? id,
    double? price,
    String? description,
    List<int>? counts,
    List<String>? images,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      description: description ?? this.description,
      counts: counts ?? this.counts,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
