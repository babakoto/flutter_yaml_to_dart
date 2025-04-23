import '../model_parser.dart';

void equatablePropsGenerator(StringBuffer buffer, ModelDefinition model) {
  if (model.equatable) {
    buffer.writeln('\n  @override');
    buffer.writeln('  List<Object?> get props => [');
    for (var field in model.fields) {
      buffer.writeln('    ${field.name},');
    }
    buffer.writeln('  ];');
  }
}
