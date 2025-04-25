// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'status.dart';

class Collection extends Equatable {
  final String id;
  final String title;
  final int counts;
  final Status status;
  final DateTime createdAt;

  const Collection({
    required this.id,
    required this.title,
    this.counts = 0,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'counts': counts,
      'status_file': status,
      'created_at': createdAt,
    };
  }

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      counts: int.parse(json['counts']),
      status: Status.fromMap(json['status_file']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    counts,
    status,
    createdAt,
  ];

  Collection copyWith({
    String? id,
    String? title,
    int? counts,
    Status? status,
    DateTime? createdAt,
  }) {
    return Collection(
      id: id ?? this.id,
      title: title ?? this.title,
      counts: counts ?? this.counts,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
