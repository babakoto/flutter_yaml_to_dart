import '../model_parser.dart';
import 'enum_generator.dart';

void importDependencies(StringBuffer buffer, ModelDefinition model, String folderPath) {
  Set<String> dependencies = {};
  for (var field in model.fields) {
    if (field.isObjectOrListOfObject() || field.isEnum) {
      dependencies.add("import '${field.name.toLowerCase()}.dart';");
      enumGenerator(model, folderPath);
    }
  }

  dependencies.forEach((dependency) {
    buffer.writeln(dependency);
  });
}
