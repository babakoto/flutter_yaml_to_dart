// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'product.dart';
import 'status.dart';

class Collection extends Equatable {
  final String id;
  final String? title;
  final int counts;
  final Product product;
  final bool? isActive;
  final List<Product> products;
  final Status status;
  final DateTime createdAt;

  const Collection({
    required this.id,
    this.title = '',
    this.counts = 0,
    required this.product,
    this.isActive = false,
    this.products = const [],
    this.status = Status.inactiveFile,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'counts': counts,
      'product': product,
      'isActive': isActive,
      'products': products,
      'status_file': status,
      'created_at': createdAt,
    };
  }

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      counts: int.parse(json['counts']),
      product: Product.fromMap(json['product']),
      isActive: json['isActive'] ?? false,
      products: json['products'] != null ? List<Product>.from(json['products'].map((x) => Product.fromMap)) : [],
      status: json['status_file'] != null ? Status.fromMap(json['status_file']) : Status.inactiveFile,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    counts,
    product,
    isActive,
    products,
    status,
    createdAt,
  ];

  Collection copyWith({
    String? id,
    String? title,
    int? counts,
    Product? product,
    bool? isActive,
    List<Product>? products,
    Status? status,
    DateTime? createdAt,
  }) {
    return Collection(
      id: id ?? this.id,
      title: title ?? this.title,
      counts: counts ?? this.counts,
      product: product ?? this.product,
      isActive: isActive ?? this.isActive,
      products: products ?? this.products,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
