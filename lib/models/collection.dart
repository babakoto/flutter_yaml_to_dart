// ⚠️ This file is auto-generated. Do not edit.

import 'package:equatable/equatable.dart';

import 'status.dart';

class Collection extends Equatable {
  final String id;
  final String title;
  final Status status;
  final DateTime createdAt;

  const Collection({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
  });

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      status: Status.fromMap(json['status_file']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    status,
    createdAt,
  ];
}
