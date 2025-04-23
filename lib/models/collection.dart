// This is an auto-generated file. Do not edit.
import 'package:equatable/equatable.dart';


class Collection extends Equatable {
  final String id;
  final String title;
  final DateTime createdAt;

  const Collection({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory Collection.fromMap(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    createdAt,
  ];
}
