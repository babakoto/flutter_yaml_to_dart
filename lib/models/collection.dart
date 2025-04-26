// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'product.dart';

class Collection extends Equatable {
  final String name;
  final List<Product> products;
  final Map<String, dynamic> data;
  final DateTime createdAt;

  const Collection({
    required this.name,
    this.products = const [],
    required this.data,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'products': products,
      'data': data,
      'created_at': createdAt,
    };
  }

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      name: json['name'] as String,
      products: json['products'] != null ? List<Product>.from(json['products'].map((x) => Product.fromMap(x))) : [],
      data: Map<String, dynamic>.from(json['data']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [
    name,
    products,
    data,
    createdAt,
  ];

  Collection copyWith({
    String? name,
    List<Product>? products,
    Map<String, dynamic>? data,
    DateTime? createdAt,
  }) {
    return Collection(
      name: name ?? this.name,
      products: products ?? this.products,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
