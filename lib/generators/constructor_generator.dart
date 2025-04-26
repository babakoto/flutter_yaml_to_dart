import '../model_parser.dart';
import '../utils.dart';

String constructorGenerator(ModelDefinition model) {
  StringBuffer buffer = StringBuffer();
  if (model.constructor) {
    buffer.writeln('\n  const ${model.className}({');
    for (var field in model.fields) {
      if (field.isArray()) {
        buffer.writeln('    this.${field.name} = const ${field.defaultValue ?? []},');
      } else {
        if (field.isOptional || field.hasDefaultValue()) {
          if (field.hasDefaultValue()) {
            if (field.isEnum) {
              buffer.writeln(
                '    this.${field.name} = ${field.name.capitalize()}.${field.defaultValue!.toVariableCamelCase()},',
              );
            } else {
              switch (field.getType()) {
                case 'String':
                  buffer.writeln(
                    "    this.${field.name} = ${field.defaultValue!.isEmpty ? "''" : "'${field.defaultValue}'"},",
                  );
                case 'DateTime':
                  buffer.writeln("    ${!field.isOptional ? 'required' : ''} this.${field.name},");

                default:
                  buffer.writeln('    this.${field.name} = ${field.defaultValue},');
              }
            }
          } else {
            buffer.writeln('   this.${field.name},');
          }
        } else {
          buffer.writeln('    required this.${field.name},');
        }
      }
    }
    buffer.writeln('  });');
    return buffer.toString();
  } else {
    return '';
  }
}
