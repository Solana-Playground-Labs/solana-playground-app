import 'package:solana_playground_language/solana_playground_language.dart';
import 'package:solana_playground_language/src/base_builder.dart';

abstract class StatementBuilder extends BaseBuilder {
  StatementBuilder(): super();

  @override
  StatementBuilder copy();

  BaseStatement get statement;
}
