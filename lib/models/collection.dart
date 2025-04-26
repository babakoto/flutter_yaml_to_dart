// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'product.dart';

class Collection extends Equatable {
  final String name;
  final List<Product> products;
  final DateTime createdAt;

  const Collection({required this.name, this.products = const [], required this.createdAt});

  Map<String, dynamic> toMap() {
    return {'name': name, 'products': products, 'created_at': createdAt};
  }

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      name: json['name'] as String,
      products: json['products'] != null ? List<Product>.from(json['products'].map((x) => Product.fromMap(x))) : [],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [name, products, createdAt];

  Collection copyWith({String? name, List<Product>? products, DateTime? createdAt}) {
    return Collection(
      name: name ?? this.name,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
