import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';

abstract class FocusBuilder extends Equatable {
  final Builder builder;

  const FocusBuilder(this.builder);

  @override
  List<Object?> get props => [builder];
}

class CommandFocusBuilder extends FocusBuilder {
  final BlockCommandBuilder blockBuilder;

  const CommandFocusBuilder({
    required this.blockBuilder,
    required Builder builder,
  }) : super(builder);

  @override
  List<Object?> get props => [...super.props, blockBuilder];
}

class ExpressionFocusBuilder extends FocusBuilder {
  final String? label;

  const ExpressionFocusBuilder({
    required this.label,
    required Builder builder,
  }) : super(builder);

  @override
  List<Object?> get props => [...super.props, label];
}
