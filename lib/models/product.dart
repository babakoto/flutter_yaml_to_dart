// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'status.dart';

class Product extends Equatable {
  final String id;
  final double price;
  final String? name;
  final bool? isAvailable;
  final List<String> images;
  final int? max;
  final Status? status;
  final String? description;
  final List<int> counts;
  final DateTime? createdAt;

  const Product({
    required this.id,
    required this.price,
   this.name,
   this.isAvailable,
    this.images = const ['madagascar','paris','newyork'],
    this.max = 0,
    this.status = Status.activeFile,
   this.description,
    this.counts = const [1, 2, 3],
     this.createdAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'isAvailable': isAvailable,
      'images': images,
      'max': max,
      'status': status,
      'description': description,
      'counts': counts,
      'created_at': createdAt,
    };
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      price: json['price'] as double,
      name: json['name'] as String?,
      isAvailable: json['isAvailable'] as bool?,
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      max: json['max'] as int? ?? 0,
      status: json['status'] != null ? Status.fromMap(json['status']) : Status.activeFile,
      description: json['description'] as String?,
      counts: json['counts'] != null ? List<int>.from(json['counts']) : [],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    price,
    name,
    isAvailable,
    images,
    max,
    status,
    description,
    counts,
    createdAt,
  ];

  Product copyWith({
    String? id,
    double? price,
    String? name,
    bool? isAvailable,
    List<String>? images,
    int? max,
    Status? status,
    String? description,
    List<int>? counts,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      isAvailable: isAvailable ?? this.isAvailable,
      images: images ?? this.images,
      max: max ?? this.max,
      status: status ?? this.status,
      description: description ?? this.description,
      counts: counts ?? this.counts,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
