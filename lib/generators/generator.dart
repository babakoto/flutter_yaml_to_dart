import '../model_parser.dart';
import 'constructor_generator.dart';
import 'copy_with_generator.dart';
import 'equatable_generator.dart';
import 'fromMap_generator.dart';
import 'import_file_generator.dart';
import 'tomap_generator.dart';

String generateClass(ModelDefinition model) {
  final buffer = StringBuffer();
  bool isEquatable = model.equatable;

  buffer.writeln('// This is an auto-generated file. Do not edit.');
  if (isEquatable) {
    buffer.writeln("import 'package:equatable/equatable.dart';");
  }
  buffer.writeln();

  /// Import the necessary files (class,enums,...)
  importObjects(buffer, model);

  buffer.writeln();

  buffer.writeln('class ${model.className} ${isEquatable ? "extends Equatable {" : "{"}');

  // generate fields
  for (var field in model.fields) {
    buffer.writeln('  final ${field.type} ${field.name};');
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
