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

import 'package:solana_playground_language/lib.dart';

part 'find_program_address_command.builder.dart';

@CommandBuildable()
class FindProgramAddressCommand extends Command {
  @CommandPropertyBuildable()
  final String variable;

  @CommandPropertyBuildable()
  final Expression programID;

  @CommandPropertyBuildable()
  final Expression data;

  const FindProgramAddressCommand({
    required this.variable,
    required this.programID,
    required this.data,
  });

  @override
  List<Object> get props => [variable, programID, data];

  factory FindProgramAddressCommand.fromJson(Map<String, dynamic> json) =>
      _$FindProgramAddressCommandFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FindProgramAddressCommandToJson(this);

  @override
  FindProgramAddressCommandBuilder asBuilder() => _$FindProgramAddressCommandToBuilder(this);
}
