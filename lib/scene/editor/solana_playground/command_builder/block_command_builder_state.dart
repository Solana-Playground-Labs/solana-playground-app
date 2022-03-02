part of 'block_builder_cubit.dart';

class StatementsBuilderState extends Equatable {
  final List<CommandBuilder> commands;

  const StatementsBuilderState({this.commands = const []});

  CommandBuilder? before(CommandBuilder builder) {
    final index = commands.indexOf(builder);
    if (index - 1 < 0) return null;
    return commands[index - 1];
  }

  CommandBuilder? after(CommandBuilder builder) {
    final index = commands.indexOf(builder);
    if (index + 1 >= commands.length) return null;
    return commands[index + 1];
  }

  @override
  List<Object?> get props => [commands];

  StatementsBuilderState copyWith({
    List<CommandBuilder>? commands,
  }) {
    return StatementsBuilderState(
      commands: commands ?? this.commands,
    );
  }
}
