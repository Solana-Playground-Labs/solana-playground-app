part of 'block_command_builder_cubit.dart';

class BlockCommandBuilderState extends Equatable {
  final List<CommandBuilder> commands;

  const BlockCommandBuilderState({this.commands = const []});

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

  BlockCommandBuilderState copyWith({
    List<CommandBuilder>? commands,
  }) {
    return BlockCommandBuilderState(
      commands: commands ?? this.commands,
    );
  }
}
