import 'package:flutter_yaml_to_dart/model_parser.dart';

void constructorGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.constructor) {
    buffer.writeln('\n  const ${model.className}({');
    for (var field in model.fields) {
      if (field.isRequired()) {
        buffer.writeln('    required this.${field.name},');
      } else {
        buffer.writeln('    this.${field.name},');
      }
    }
    buffer.writeln('  });');
  }
}
