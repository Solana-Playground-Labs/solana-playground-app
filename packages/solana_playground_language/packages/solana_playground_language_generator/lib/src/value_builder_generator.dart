import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:solana_playground_language_generator/annotations.dart';
import 'package:solana_playground_language_generator/src/value_model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class ValueBuilderGenerator extends GeneratorForAnnotation<ValueBuildable> {
  @override
  dynamic generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final displayName = !annotation.read('displayName').isNull
        ? annotation.read('displayName').stringValue
        : element.name!.replaceAll("Value", "");

    final valueModelVisitor = ValueModelVisitor(
      className: element.name!,
      displayName: displayName,
    );
    element.visitChildren(valueModelVisitor);

    return _template(model: valueModelVisitor);
  }
}

String _template({
  required ValueModelVisitor model,
}) {
  final classNameBuilder = "${model.className}Builder";

  return '''
  class $classNameBuilder extends ValueBuilder {
    ${model.propertiesBuilder.asBuilder()}
    
    @override
    String get name => "${model.displayName}";
  
    $classNameBuilder({${model.propertiesBuilder.asConstructorArgs()},}) ${model.propertiesBuilder.asConstructorInitArgs()};
  
    @override
    ${model.className} build() {
      return ${model.className}(${model.propertiesBuilder.asValueArgs()},);
    }
  
    @override
    $classNameBuilder clone() {
      return $classNameBuilder(${model.propertiesBuilder.asCloneArgs()},);
    }
  }
 
  ${model.className} _\$${model.className}FromJson(Map<String, dynamic> json) {
    return ${model.className}(${model.propertiesBuilder.fromJsonArgs()},);
  }
  
  Map<String, dynamic> _\$${model.className}ToJson(${model.className} value) {
    return {${model.propertiesBuilder.toJsonArgs()},};
  }
  
  ${model.className}Builder _\$${model.className}ToBuilder(${model.className} value) {
    return ${model.className}Builder(${model.propertiesBuilder.asBuilderArgs()});
  }

  ''';
}

extension FieldUtils on List<FieldElement> {
  String asConstructorArgs() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return 'required this.${e.name}';
          } else {
            return 'required ${e.type.element!.name} ${e.name}';
          }
        },
      ).join(", ");

  String asConstructorInitArgs() {
    final s = where((e) => e.type.element!.name != 'Expression');
    if (s.isEmpty) return "";

    return ":${s.map(
      (e) {
        return '_${e.name} = ${e.name}';
      },
    ).join(", ")}";
  }

  String asBuilderArgs() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return '${e.name}: value.${e.name}.asBuilder()';
          } else {
            return '${e.name}: value.${e.name}';
          }
        },
      ).join(", ");

  String asValueArgs() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return '${e.name}: ${e.name}.build()';
          } else {
            return '${e.name}: ${e.name}';
          }
        },
      ).join(", ");

  String asCloneArgs() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return '${e.name}: ${e.name}.clone()';
          } else {
            return '${e.name}: ${e.name}';
          }
        },
      ).join(", ");

  String asBuilder() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return 'final ExpressionBuilder ${e.name};';
          } else {
            return '''
            ${e.type.element!.name} _${e.name};
            
            ${e.type.element!.name} get ${e.name} => _${e.name};

            set ${e.name}(${e.type.element!.name} value) {
              _${e.name} = value;
              notifyListeners();
            }
            
            ''';
          }
        },
      ).join('\n');

  String fromJsonArgs() => map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return "${e.name}: Expression.fromJson(json['${e.name}'])";
          } else {
            return "${e.name}: json['${e.name}']";
          }
        },
      ).join(", ");

  String toJsonArgs() => "'type': value.runtimeType.toString(), ${map(
        (e) {
          if (e.type.element!.name == 'Expression') {
            return "'${e.name}': value.${e.name}.toJson()";
          } else {
            return "'${e.name}': value.${e.name}";
          }
        },
      ).join(", ")}";
}
