import '../model_parser.dart';
import '../utils.dart';

void copyWithGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.copyWith) {
    buffer.writeln('\n  ${model.className} copyWith({');
    for (var field in model.fields) {
      if (field.isEnum) {
        buffer.writeln('    ${field.name.capitalize()}? ${field.name},');
      } else {
        buffer.writeln('    ${field.getType()}? ${field.name},');
      }
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
