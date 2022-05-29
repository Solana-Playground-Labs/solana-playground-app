import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:solana_playground_language_generator/annotations.dart';
import 'package:source_gen/source_gen.dart';

class ValueModelVisitor extends SimpleElementVisitor {
  final String className;

  List<FieldElement> propertiesBuilder = [];

  ValueModelVisitor({
    required this.className,
  });

  @override
  visitFieldElement(FieldElement element) {
    if (TypeChecker.fromRuntime(ValuePropertyBuildable)
        .annotationsOf(element)
        .isNotEmpty) {
      propertiesBuilder.add(element);
    }
  }
}
