import 'dart:io';

List<File> findModelFiles(String path) {
  final dir = Directory(path);
  return dir.listSync(recursive: true).whereType<File>().where((file) => file.path.endsWith('.model.yaml')).toList();
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String toVariableCamelCase() {
    return replaceAllMapped(RegExp('(_[a-z])'), (match) {
      return match.group(0)!.replaceFirst('_', '').toUpperCase();
    });
  }

  String toClassCamelCase() {
    return replaceAllMapped(RegExp('(_[a-z])'), (match) {
      return match.group(0)!.replaceFirst('_', '').toUpperCase();
    }).capitalize();
  }

  /// Extracts the type from a string.
  /// For example:
  /// - "List<Object>" will return "object"
  /// - "Object" will return "object"
  /// - "List<String>" will return "string"
  String extractType() {
    final regex = RegExp(r'List<(\w+)>');
    final match = regex.firstMatch(this);

    if (match != null) {
      return match.group(1)!.toLowerCase(); // Cas "List<Object>"
    } else {
      return toLowerCase(); // Cas "Object"
    }
  }

  log() {
    print(this);
  }
}
