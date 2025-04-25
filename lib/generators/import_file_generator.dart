import '../model_parser.dart';
import '../utils.dart';
import 'enum_generator.dart';

void importDependencies(StringBuffer buffer, ModelDefinition model, String folderPath) {
  Set<String> dependencies = {};
  for (var field in model.fields) {
    if (field.isEnum) {
      dependencies.add("import '${field.name.toLowerCase()}.dart';");
      enumGenerator(model, folderPath);
    } else if (field.isObjectOrListOfObject()) {
      dependencies.add("import '${field.type.extractType()}.dart';");
    }
  }

  dependencies.forEach((dependency) {
    buffer.writeln(dependency);
  });
}
