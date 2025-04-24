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
}
