// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'product.dart';

class Collection extends Equatable {
  final String name;
  final int counts;
  final double price;
  final Product product;
  final List<Product> products;
  final List<String> images;
  final bool isAvailable;
  final DateTime createdAt;

  const Collection({
    required this.name,
    required this.counts,
    required this.price,
    required this.product,
    this.products = const [],
    this.images = const [],
    required this.isAvailable,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'counts': counts,
      'price': price,
      'product': product,
      'products': products,
      'images': images,
      'isAvailable': isAvailable,
      'createdAt': createdAt,
    };
  }

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      name: json['name'] as String,
      counts: json['counts'] as int,
      price: json['price'] as double,
      product: Product.fromMap(json['product']),
      products: json['products'] != null ? List.from(json['products'].map((x) => Product.fromMap)) : [],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      isAvailable: json['isAvailable'] as bool,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  List<Object?> get props => [
    name,
    counts,
    price,
    product,
    products,
    images,
    isAvailable,
    createdAt,
  ];

  Collection copyWith({
    String? name,
    int? counts,
    double? price,
    Product? product,
    List<Product>? products,
    List<String>? images,
    bool? isAvailable,
    DateTime? createdAt,
  }) {
    return Collection(
      name: name ?? this.name,
      counts: counts ?? this.counts,
      price: price ?? this.price,
      product: product ?? this.product,
      products: products ?? this.products,
      images: images ?? this.images,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
