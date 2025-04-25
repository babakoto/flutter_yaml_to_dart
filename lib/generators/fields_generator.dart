import '../model_parser.dart';
import '../utils.dart';

void fieldsGenerator(StringBuffer buffer, ModelDefinition model) {
  /// generate fields
  for (var field in model.fields) {
    if (field.isEnum) {
      buffer.writeln('  final ${field.name.capitalize()}${field.isOptional ? '?' : ''} ${field.name};');
    } else {
      buffer.writeln('  final ${field.type} ${field.name};');
    }
  }
}
