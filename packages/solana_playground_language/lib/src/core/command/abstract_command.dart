/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_language/src/core/command/generate_keypair_command.dart';
import 'package:solana_playground_language/src/core/command/make_simple_transaction.dart';
import 'package:solana_playground_language/src/core/command/unknown_command.dart';
import 'package:solana_playground_language/src/extensions/type_extension.dart';

abstract class Command extends Equatable with ObjectType {
  const Command();

  static Command fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == (BlockCommand).toString()) {
      return BlockCommand.fromJson(type);
    } else if (type == (CommentCommand).toString()) {
      return CommentCommand.fromJson(json);
    } else if (type == (DeclareVariableCommand).toString()) {
      return DeclareVariableCommand.fromJson(json);
    } else if (type == (GetRecentBlockHashCommand).toString()) {
      return GetRecentBlockHashCommand.fromJson(json);
    } else if (type == (ImportKeypairFromStorageCommand).toString()) {
      return ImportKeypairFromStorageCommand.fromJson(json);
    } else if (type == (PrintCommand).toString()) {
      return PrintCommand.fromJson(json);
    } else if (type == (RequestRecentBlockhash).toString()) {
      return RequestRecentBlockhash.fromJson(json);
    } else if (type == (SendTransactionCommand).toString()) {
      return SendTransactionCommand.fromJson(json);
    } else if (type == (WaitTransactionConfirmationCommand).toString()) {
      return WaitTransactionConfirmationCommand.fromJson(json);
    } else if (type == (MakeSimpleTransaction).toString()) {
      return MakeSimpleTransaction.fromJson(json);
    } else if (type == (MakeKeyPairCommand).toString()) {
      return MakeKeyPairCommand.fromJson(json);
    } else if (type == (CreateSplAssociatedTokenAccountCommand).toString()) {
      return CreateSplAssociatedTokenAccountCommand.fromJson(json);
    } else if (type == (SignCommand).toString()) {
      return SignCommand.fromJson(json);
    } else if (type == (GenerateKeypairCommand).toString()) {
      return GenerateKeypairCommand.fromJson(json);
    } else if (type == (FindProgramAddressCommand).toString()) {
      return FindProgramAddressCommand.fromJson(json);
    }

    return UnknownCommand(rawData: json);
  }

  Map<String, dynamic> toJson();

  CommandBuilder asBuilder();
}
