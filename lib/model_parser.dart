import 'dart:io';

import 'package:yaml/yaml.dart';

import 'utils.dart';

class ModelField {
  final String name;
  final String type;
  final String? jsonKey;
  final String? defaultValue;
  final List<String> enumValues;

  ModelField(this.name, this.type, {this.jsonKey, this.defaultValue, this.enumValues = const []});

  bool isRequired() {
    return !type.contains('?');
  }

  bool get isOptional => !isRequired();

  bool hasDefaultValue() {
    return defaultValue != null;
  }

  bool get isEnum => enumValues.isNotEmpty && (type == 'enum' || type == 'enum?');

  String getType() {
    if (type.contains('?')) {
      return type.replaceAll('?', '');
    }
    return type;
  }

  String getTypeOfList() {
    if (getType().contains('List')) {
      return getType().replaceAll('List<', '').replaceAll('>', '');
    }
    return getType();
  }

  bool get isMap => type.contains('Map') && !type.contains('List');

  bool get isMapList => type.contains('List') && type.contains('Map');

  String typeConvert() {
    if (isMap) {
      if (isOptional) {
        return "json['${jsonKey ?? name}'] != null ? Map<String, dynamic>.from(json['${jsonKey ?? name}']) : $defaultValue,";
      }
      return "$type.from(json['${jsonKey ?? name}']),";
    }

    if (isMapList) {
      return "json['${jsonKey ?? name}'] != null ? $type.from(json['${jsonKey ?? name}']) : [],";
    }

    if (isListOfPrimitives()) {
      return "json['${jsonKey ?? name}'] != null ? ${getType()}.from(json['${jsonKey ?? name}']) : [],";
    }

    if (isListOfObjects()) {
      return "json['${jsonKey ?? name}'] != null ? ${getType()}.from(json['${jsonKey ?? name}'].map((x) => ${getTypeOfList()}.fromMap(x))) : [],";
    }

    if (isObject()) {
      if (isRequired()) {
        return "${getType()}.fromMap(json['${jsonKey ?? name}']),";
      } else {
        return "json['${jsonKey ?? name}'] != null ? ${getType()}.fromMap(json['${jsonKey ?? name}']) : null,";
      }
    }

    switch (getType()) {
      case 'double' || 'String' || 'int' || 'bool':
        if (defaultValue != null) {
          return "json['${jsonKey ?? name}'] as $type ?? $defaultValue,";
        } else {
          return "json['${jsonKey ?? name}'] as $type,";
        }
      case 'enum':
        if (type.contains('?')) {
          return "json['${jsonKey ?? name}'] != null ? ${name.capitalize()}.fromMap(json['${jsonKey ?? name}']) : ${defaultValue != null ? '${name.capitalize()}.${defaultValue?.toVariableCamelCase()}' : null},";
        } else {
          return "${name.capitalize()}.fromMap(json['${jsonKey ?? name}']),";
        }
      case 'DateTime':
        if (type.contains('?')) {
          return "json['${jsonKey ?? name}'] != null ? DateTime.parse(json['${jsonKey ?? name}']) : $defaultValue,";
        } else {
          return "DateTime.parse(json['${jsonKey ?? name}']),";
        }
      default:
        return type;
    }
  }

  bool isListOfPrimitives() {
    return getType().contains('List<String>') ||
        getType().contains('List<int>') ||
        getType().contains('List<double>') ||
        getType().contains('List<bool>');
  }

  bool isListOfObjects() {
    return isArray() && !isListOfPrimitives();
  }

  bool isObject() {
    return !isArray() && !isPrimitive();
  }

  bool isPrimitive() {
    return getType() == 'int' ||
        getType() == 'double' ||
        getType() == 'String' ||
        getType() == 'bool' ||
        getType() == 'DateTime' ||
        getType() == 'enum' ||
        getType().contains('Map');
  }

  bool isObjectOrListOfObject() {
    return !isPrimitive() && !isListOfPrimitives();
  }

  bool isArray() {
    return getType().contains('List');
  }

  String getObjectType() {
    if (isListOfObjects()) {
      return getType().replaceAll('List<', '').replaceAll('>', '');
    }
    if (isObject()) {
      return getType();
    }

    return '';
  }
}

class ModelDefinition {
  final String className;
  final List<ModelField> fields;
  final bool constructor;
  final bool equatable;
  final bool copyWith;
  final bool fromMap;
  final bool toMap;

  ModelDefinition({
    required this.className,
    required this.fields,
    this.constructor = true,
    this.equatable = true,
    this.copyWith = false,
    this.fromMap = true,
    this.toMap = false,
  });
}

ModelDefinition parseModelFile(File file) {
  final yaml = loadYaml(file.readAsStringSync()) as YamlMap;

  final className = yaml['class'] as String;

  final fields = <ModelField>[];
  final yamlFields = yaml['fields'] as YamlList;
  for (var item in yamlFields) {
    if (item is YamlMap) {
      final dartName = item.keys.first.toString();
      final dartType = item.values.first.toString();

      // Check if there’s a "key" or "name" (JSON key override)
      final jsonKey = item['key']?.toString() ?? dartName;
      final String? defaultValue = item['default']?.toString();
      List<String> enumValues = [];

      if ((dartType == 'enum' || dartType == 'enum?') && item['values'] == null) {
        throw const FormatException("""
 Invalid Enum format : Define enum values in the yaml file
          Example:
            - status: enum
              values: ['value1', 'value2', 'value3']
          """);
      }

      if ((dartType == 'enum' || dartType == 'enum?') && (item['values'] as YamlList).isNotEmpty) {
        enumValues = (item['values'] as YamlList).map((e) => e.toString()).toList();
      }

      fields.add(ModelField(dartName, dartType, jsonKey: jsonKey, defaultValue: defaultValue, enumValues: enumValues));
    } else {
      throw FormatException('Invalid field format: $item');
    }
  }

  return ModelDefinition(
    className: className,
    fields: fields,
    constructor: yaml['constructor'] ?? true,
    equatable: yaml['equatable'] ?? true,
    copyWith: yaml['copyWith'] ?? false,
    fromMap: yaml['fromMap'] ?? true,
    toMap: yaml['toMap'] ?? false,
  );
}

class EnumField {
  final String name;
  final List<String> values;

  EnumField(this.name, this.values);
}
