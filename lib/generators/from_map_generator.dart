import '../model_parser.dart';

void fromMapGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.fromMap) {
    buffer.writeln('\n  factory ${model.className}.fromMap(Map<String, dynamic> json) {');
    buffer.writeln('    return ${model.className}(');
    for (var field in model.fields) {
      buffer.writeln('      ${field.name}: ${field.typeConvert()}');
    }
    buffer.writeln('    );');
    buffer.writeln('  }');
  }
}
