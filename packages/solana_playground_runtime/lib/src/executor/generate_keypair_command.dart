// Solana Playground
// Copyright (C) 2022 Tran Giang Long
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:solana/solana.dart';
import 'package:solana_playground_language/lib.dart';
import 'package:solana_playground_runtime/src/sp_runtime.dart';

Future<void> executeGenerateKeypairCommand(
  SPRuntime runtime,
  GenerateKeypairCommand command,
) async {
  final keypair = await Ed25519HDKeyPair.random();
  await runtime.memory.keypairStorage.write(
    keypair.publicKey.bytes,
    (await keypair.extract()).bytes,
  );
  runtime.memory.write(command.variable, keypair.publicKey.bytes);
}
