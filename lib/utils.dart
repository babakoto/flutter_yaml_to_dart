import 'dart:io';

List<File> findModelFiles(String path) {
  final dir = Directory(path);
  return dir.listSync(recursive: true).whereType<File>().where((file) => file.path.endsWith('.model.yaml')).toList();
}
