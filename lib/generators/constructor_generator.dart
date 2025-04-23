import '../model_parser.dart';

void constructorGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.constructor) {
    buffer.writeln('\n  const ${model.className}({');
    for (var field in model.fields) {
      if (field.isArray()) {
        buffer.writeln('    this.${field.name} = const [],');
      } else {
        if (field.isOptional || field.hasDefaultValue()) {
          if (field.hasDefaultValue()) {
            print('Default value for ${field.name} is ${field.defaultValue}');
            buffer.writeln('    this.${field.name} = ${field.defaultValue!.isEmpty ? "''" : field.defaultValue},');
          } else {
            buffer.writeln('    this.${field.name},');
          }
        } else {
          buffer.writeln('    required this.${field.name},');
        }
      }
    }
    buffer.writeln('  });');
  }
}
