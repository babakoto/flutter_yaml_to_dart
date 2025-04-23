import '../model_parser.dart';

void constructorGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.constructor) {
    buffer.writeln('\n  const ${model.className}({');
    for (var field in model.fields) {
      if (field.isArray()) {
        buffer.writeln('    this.${field.name} = const [],');
      } else {
        buffer.writeln('   ${field.isRequired() ? "required" : ""} this.${field.name},');
      }
    }
    buffer.writeln('  });');
  }
}
