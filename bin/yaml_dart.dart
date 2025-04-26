import 'package:flutter_yaml_to_dart/commands/commands.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    throw Exception('❌ No arguments provided');
  } else {
    runCommand(options: arguments[0]);
  }
}
