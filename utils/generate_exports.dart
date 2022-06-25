import 'dart:io';
import 'package:path/path.dart';
import 'package:args/args.dart';

// This script generates a file, which exports recursively other files in the directory.

// Example:  dart ./utils/generate_exports.dart ./lib/screen -i "state.dart"
// - lib
// -   screen
// -   screen.dart // <- generated file, which exports login/login.dart
// -     login
// -       login_screen.dart
// -       login_cubit.dart
// -       login.dart <- generated file, which exports login_screen and login_cubit.

main(List<String> arguments) {
  final parser = ArgParser()..addMultiOption('ignore', abbr: 'i');
  final args = parser.parse(arguments);

  generate(Directory(args.rest.last), ignorePatterns: args['ignore']);
}

String generate(Directory currentDir, {List<String> ignorePatterns = const []}) {
  String output = '';

  for (final file in currentDir.listSync()) {
    if (file is Directory) {
      output +=
          "export '${basename(file.path)}/${generate(file, ignorePatterns: ignorePatterns)}';\n";
    } else if (file is File) {
      if (basename(file.path) == "${basename(currentDir.path)}.dart") continue;
      if (isIgnoring(basename(file.path), ignorePatterns)) continue;

      output += "export '${basename(file.path)}';\n";
    }
  }

  final outputFile = File(join(currentDir.path, '${basename(currentDir.path)}.dart'));
  outputFile.writeAsStringSync(output);

  return "${basename(currentDir.path)}.dart";
}

bool isIgnoring(String path, List<String> ignorePatterns) {
  for (var pattern in ignorePatterns) {
    if (path.contains(pattern)) return true;
  }
  return false;
}

/*
MIT License
Copyright (c) 2021 Giang Long Tran
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
