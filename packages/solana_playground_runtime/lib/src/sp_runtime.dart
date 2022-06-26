/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:collection/collection.dart';
import 'package:solana_playground_runtime/src/calculator/bool_value.dart';
import 'package:solana_playground_runtime/src/calculator/special/instruction_value.dart';
import 'package:solana_playground_runtime/src/calculator/string_utf8.dart';
import 'package:solana_playground_runtime/src/executor/generate_keypair_command.dart';
import 'package:solana_playground_runtime/src/executor/make_keypair_command.dart';

import '../solana_playground_runtime.dart';

class SPRuntime {
  final SolanaClient solanaClient;

  final SPMemory _memory = SPMemory();
  final SPConsole console = SPConsole();
  final SPKeypairProvider keypairProvider;

  SPRuntime({
    required this.solanaClient,
    required this.keypairProvider,
  });

  dynamic _result;

  dynamic get result => _result;

  SPMemory get memory => _memory;

  Future<dynamic> run(Package package) async {
    if (package.packageType != PackageType.application) {
      throw Exception("The package should be application type");
    }

    final mainScript = package.scripts.firstWhereOrNull((e) => e.name == 'main');
    if (mainScript == null) {
      throw Exception("Can not find main script");
    }

    try {
      return await execute(mainScript.blockCommand);
    } catch (e) {
      console.streamController.add(e);
      rethrow;
    }
  }

  Future<void> execute(Command command) async {
    if (command is BlockCommand) {
      await executeBlockCommand(this, command);
    } else if (command is DeclareVariableCommand) {
      await executeDeclareVariable(this, command);
    } else if (command is PrintCommand) {
      await executePrintCommand(this, command);
    } else if (command is GetRecentBlockHashCommand) {
      await executeGetRecentBlockHashCommand(this, command);
    } else if (command is ImportKeypairFromStorageCommand) {
      await executeImportKeypairCommand(this, command);
    } else if (command is SendTransactionCommand) {
      await executeSendTransactionCommand(this, command);
    } else if (command is WaitTransactionConfirmationCommand) {
      await executeWaitTransactionConfirmation(this, command);
    } else if (command is CommentCommand) {
      return;
    } else if (command is SignCommand) {
      await executeSignCommand(this, command);
    } else if (command is CreateSplAssociatedTokenAccountCommand) {
      await executeCreateSplAssociatedTokenAccount(this, command);
    } else if (command is MakeSimpleTransaction) {
      await executeMakeSimpleTransaction(this, command);
    } else if (command is GenerateKeypairCommand) {
      await executeGenerateKeypairCommand(this, command);
    } else if (command is MakeKeyPairCommand) {
      await executeMakeKeypairCommand(this, command);
    } else {
      throw Exception("Unknown command ${command.runtimeType}");
    }
  }

  Future<dynamic> calculate(Expression expression) async {
    final value = expression.value;
    if (value is ComputableValue) {
      return calculateConstantValue(this, value);
    } else if (value is VariableValue) {
      return calculateVariableValue(this, value);
    } else if (value is BinaryValue) {
      return calculateBinaryValue(this, value);
    } else if (value is ByteValue) {
      return calculateByteValue(this, value);
    } else if (value is HexValue) {
      return calculateHexValue(this, value);
    } else if (value is StringByteValue) {
      return calculateStringByteValue(this, value);
    } else if (value is IntValue) {
      return calculateIntValue(this, value);
    } else if (value is DoubleValue) {
      return calculateDoubleValue(this, value);
    } else if (value is StringValue) {
      return calculateStringValue(this, value);
    } else if (value is ConditionalWrapperValue) {
      return calculateConditionalWrapperValue(this, value);
    } else if (value is AccountValue) {
      return calculateAccountValue(this, value);
    } else if (value is InstructionValue) {
      return calculateInstructionValue(this, value);
    } else if (value is BoolValue) {
      return calculateBoolValue(this, value);
    } else if (value is ListValue) {
      return calculateListValue(this, value);
    } else if (value is StringUtf8Value) {
      return calculateStringUtf8(this, value);
    } else {
      throw Exception("Unknown value ${value.runtimeType}");
    }
  }

  Future<void> dispose() async {
    await console.dispose();
  }
}
