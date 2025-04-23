import '../model_parser.dart';

void importObjects(StringBuffer buffer, ModelDefinition model) {
  Set<String> dependencies = {};
  for (var field in model.fields) {
    if (field.isObjectOrListOfObject()) {
      dependencies.add("import '${field.getObjectType().toLowerCase()}.dart';");
    }
  }

  dependencies.forEach((dependency) {
    buffer.writeln(dependency);
  });
}
