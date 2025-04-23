import 'dart:developer';
import 'dart:io';

import 'package:flutter_yaml_to_dart/generators/generator.dart';
import 'package:flutter_yaml_to_dart/model_parser.dart';
import 'package:flutter_yaml_to_dart/utils.dart';
import 'package:yaml/yaml.dart';

void main(List<String> arguments) {
  final configFile = File('flutter_data.yaml');
  if (!configFile.existsSync()) {
    log('❌ flutter_data.yaml file not found in the current directory');
    return;
  }

  final configContent = configFile.readAsStringSync();
  final configMap = loadYaml(configContent);

  if (configMap['models'] == null || configMap['models'] is! YamlList || configMap['models'].isEmpty) {
    log('❌ No models configuration found in flutter_data.yaml');
    return;
  }

  final firstModelConfig = configMap['models'][0];
  final outputPath = firstModelConfig['output'] ?? 'lib/models';

  readYamlModels(outputPath);
}

void readYamlModels(String folderPath) {
  final files = findModelFiles(Directory.current.path);
  for (final file in files) {
    final model = parseModelFile(file);
    final dartCode = generateClass(model);
    final outFile = File('$folderPath/${model.className.toLowerCase()}.dart');
    outFile.createSync(recursive: true);
    outFile.writeAsStringSync(dartCode);
    log('✅ Generated ${outFile.path}');
  }
}
