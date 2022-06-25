import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:solana_playground_language_generator/annotations.dart';
import 'package:source_gen/source_gen.dart';

class CommandModelVisitor extends SimpleElementVisitor {
  final String className;

  List<FieldElement> propertiesBuilder = [];

  CommandModelVisitor({
    required this.className,
  });

  @override
  visitFieldElement(FieldElement element) {
    if (TypeChecker.fromRuntime(CommandPropertyBuildable).annotationsOf(element).isNotEmpty) {
      propertiesBuilder.add(element);
    }
  }
}
