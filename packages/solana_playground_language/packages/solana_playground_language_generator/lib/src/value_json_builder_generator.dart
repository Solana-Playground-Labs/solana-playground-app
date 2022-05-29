import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:solana_playground_language_generator/annotations.dart';
import 'package:source_gen/source_gen.dart';

// class ValueJsonBuilderGenerator extends GeneratorForAnnotation<ValueJsonBuildable> {
//   @override
//   dynamic generateForAnnotatedElement(
//       Element element, ConstantReader annotation, BuildStep buildStep) {
//     final valueModelVisitor = ValueJsonVisitorModel();
//     print(element.library!.name);
//     element.library!.visitChildren(valueModelVisitor);
//
//     return """
//     ValueBuilder _\$${element.name}FromJson(Map<String, dynamic> json) {
//       ${valueModelVisitor.classes.asJson()}
//     }
//     """;
//   }
// }

class ValueJsonBuilderGenerator extends Generator {
  final List<ClassElement> classes = [];

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    if (TypeChecker.fromRuntime(ValueJsonBuildable)
        .annotationsOf(library.element)
        .isNotEmpty) {

    }

    return """""";
  }
}

class ValueJsonVisitorModel extends SimpleElementVisitor {
  final List<ClassElement> classes = [];

  @override
  visitClassElement(ClassElement element) {
    if (TypeChecker.fromRuntime(ValueBuildable)
        .annotationsOf(element)
        .isNotEmpty) {
      print(element);
      classes.add(element);
    }
  }
}

extension _ClassUtils on List<ClassElement> {
  String asJson() => map(
        (e) {
          return """
          if (type == (${e.name}).toString()) {
            return ${e.name}.fromJson(json);
          }
          """;
        },
      ).join(" else ");
}
