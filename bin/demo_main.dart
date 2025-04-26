import 'package:flutter_yaml_to_dart/models/collection.dart';

void main() {
  final data = {
    'id': '123',
    'name': 'John Doe',
    'products': [
      {
        'id': '1',
        'price': 23.99,
        'description': 'description 1',
        'counts': [12],
        'images': ['image1.png', 'image2.png'],
      },
      {
        'id': '2',
        'price': 20.0,
        'description': 'description 2',
        'counts': [5],
        'images': ['image3.png', 'image4.png'],
      },
      {
        'id': '3',
        'price': 30.0,
        'description': 'description 3',
        'counts': [7],
        'images': ['image5.png', 'image6.png'],
      },
    ],
    'created_at': '2023-10-01T12:00:00Z',
  };

  final collection = Collection.fromMap(data);
  print('Collection ID: ${collection.products.length}');
}
