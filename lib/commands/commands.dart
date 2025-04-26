import 'dart:io';

import 'package:flutter_yaml_to_dart/generators/generator.dart';
import 'package:flutter_yaml_to_dart/model_parser.dart';
import 'package:flutter_yaml_to_dart/utils.dart';
import 'package:yaml/yaml.dart';

void runCommand({String? options}) {
  if (options == 'init') {
    /// Create file flutter_data.yaml
    '🚀 Initializing project ...'.log();

    '✅ Created yaml_to_dart.yaml file '.log();
  }

  final configFile = File('yaml_to_dart.yaml');
  switch (options) {
    case 'init':
      configFile.createSync();
      StringBuffer buffer = StringBuffer();
      buffer.writeln('models:');
      buffer.writeln('  - output: lib/models');
      configFile.writeAsStringSync(buffer.toString());
    case 'generate':
      if (!configFile.existsSync()) {
        throw Exception('❌ flutter_data.yaml file not found in the current directory');
      }

      final configContent = configFile.readAsStringSync();
      final configMap = loadYaml(configContent);

      if (configMap['models'] == null || configMap['models'] is! YamlList || configMap['models'].isEmpty) {
        throw Exception('❌ No models configuration found in yaml_to_dart.yaml');
      }

      final firstModelConfig = configMap['models'][0];
      final outputPath = firstModelConfig['output'] ?? 'lib/models';

      _readYamlModels(outputPath);

    default:
      '❌ Invalid command'.log();
  }
}

void _readYamlModels(String folderPath) {
  final files = findModelFiles(Directory.current.path);
  for (final file in files) {
    final model = parseModelFile(file);
    final dartCode = generateFile(model, folderPath);
    final fileDart = File('$folderPath/${model.className.toLowerCase()}.dart');
    fileDart.createSync(recursive: true);
    fileDart.writeAsStringSync(dartCode);
    '✅ Generated ${fileDart.path}'.log();
  }
}
