import 'dart:io';

import '../model_parser.dart';
import '../utils.dart';

/// generate enum from string

void enumGenerator(ModelDefinition model, String folderPath) {
  final StringBuffer buffer = StringBuffer();
  String enumName = '';
  for (var field in model.fields) {
    if (field.isEnum) {
      enumName = field.name;
      buffer.writeln('// ⚠️ This file is auto-generated. Do not edit.');
      buffer.writeln();
      buffer.writeln('enum ${field.name.capitalize()} {');
      for (var value in field.enumValues) {
        if (value == field.enumValues.last) {
          buffer.writeln('  ${value.toVariableCamelCase()};');
        } else {
          buffer.writeln('  ${value.toVariableCamelCase()},');
        }
      }
      buffer.writeln();
      for (var value in field.enumValues) {
        buffer.writeln(
          '  bool get is${value.toClassCamelCase()} => this == ${field.name.capitalize()}.${value.toVariableCamelCase()};',
        );
      }

      buffer.writeln();

      buffer.writeln(' static ${enumName.capitalize()} fromMap(Map<String,dynamic> json){');
      buffer.writeln("  switch(json['${field.jsonKey ?? field.name}']) {");
      for (var value in field.enumValues) {
        buffer.writeln("    case '$value':");
        buffer.writeln('      return ${field.name.capitalize()}.${value.toVariableCamelCase()};');
      }
      buffer.writeln('    default:');
      buffer.writeln("      throw Exception('Invalid value for ${field.jsonKey ?? field.name}');");
      buffer.writeln('  }');

      buffer.writeln('}');
      buffer.writeln('}');
      buffer.writeln();
    }
  }
  final code = buffer.toString();
  final outFile = File('$folderPath/${enumName.toLowerCase()}.dart');
  outFile.createSync(recursive: true);
  outFile.writeAsStringSync(code);
  '✅ Generated ${outFile.path}'.log();
}
