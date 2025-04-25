import '../model_parser.dart';
import '../utils.dart';
import 'constructor_generator.dart';
import 'copy_with_generator.dart';
import 'equatable_generator.dart';
import 'from_map_generator.dart';
import 'import_file_generator.dart';
import 'tomap_generator.dart';

String generateFile(ModelDefinition model, String folderPath) {
  final buffer = StringBuffer();
  bool isEquatable = model.equatable;

  buffer.writeln('// ⚠️ This file is auto-generated. Do not edit.');
  buffer.writeln();
  if (isEquatable) {
    buffer.writeln("import 'package:equatable/equatable.dart';");
  }
  buffer.writeln();

  /// Import the necessary files (class,enums,...)
  importDependencies(buffer, model, folderPath);

  buffer.writeln();

  buffer.writeln('class ${model.className} ${isEquatable ? "extends Equatable {" : "{"}');

  /// generate fields
  for (var field in model.fields) {
    if (field.isEnum) {
      buffer.writeln('  final ${field.name.capitalize()} ${field.name};');
    } else {
      buffer.writeln('  final ${field.type} ${field.name};');
    }
  }

  /// generate constructor
  constructorGenerator(buffer, model);

  /// Generate toMap method
  toMapGenerator(buffer, model);

  /// Generate fromMap method
  fromMapGenerator(buffer, model);

  /// Generate props for Equatable
  equatablePropsGenerator(buffer, model);

  /// Generate copyWith method
  copyWithGenerator(buffer, model);

  buffer.writeln('}');

  return buffer.toString();
}
