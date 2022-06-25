/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana_playground_language/lib.dart';

part 'import_keypair_from_storage.builder.dart';

@CommandBuildable()
class ImportKeypairFromStorageCommand extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final Expression walletName;

  const ImportKeypairFromStorageCommand({
    required this.variable,
    required this.walletName,
  });

  @override
  List<Object> get props => [walletName, variable];

  factory ImportKeypairFromStorageCommand.fromJson(Map<String, dynamic> json) =>
      _$ImportKeypairFromStorageCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImportKeypairFromStorageCommandToJson(this);

  @override
  ImportKeypairFromStorageCommandBuilder asBuilder() =>
      _$ImportKeypairFromStorageCommandToBuilder(this);
}
