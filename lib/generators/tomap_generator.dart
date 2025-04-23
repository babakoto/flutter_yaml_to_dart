import '../model_parser.dart';

void toMapGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.toMap) {
    buffer.writeln('\n  Map<String, dynamic> toMap() {');
    buffer.writeln('    return {');
    for (var field in model.fields) {
      buffer.writeln("      '${field.jsonKey ?? field.name}': ${field.name},");
    }
    buffer.writeln('    };');
    buffer.writeln('  }');
  }
}
