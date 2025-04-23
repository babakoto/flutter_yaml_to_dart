
import 'package:flutter_yaml_to_dart/model_parser.dart';

void copyWithGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.copyWith) {
    buffer.writeln('\n  ${model.className} copyWith({');
    for (var field in model.fields) {
      buffer.writeln('    ${field.getType()}? ${field.name},');
    }
    buffer.writeln('  }) {');
    buffer.writeln('    return ${model.className}(');
    for (var field in model.fields) {
      buffer.writeln('      ${field.name}: ${field.name} ?? this.${field.name},');
    }
    buffer.writeln('    );');
    buffer.writeln('  }');
  }
}
