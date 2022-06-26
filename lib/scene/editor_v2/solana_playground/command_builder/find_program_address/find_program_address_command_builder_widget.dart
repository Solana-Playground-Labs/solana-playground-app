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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/scene/editor_v2/common/single_text_field_value_builder.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import '../../solana_playground.dart';

class FindProgramAddressCommandBuilderWidget extends StatelessWidget {
  final CommandBuilderMetaInfo? metaInfo;
  final FindProgramAddressCommandBuilder builder;

  FindProgramAddressCommandBuilderWidget({
    Key? key,
    this.metaInfo,
    required this.builder,
  }) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ComponentHeader(
      name: commandHeaderFormatter("Make keypair", metaInfo),
      icon: SvgPicture.asset(SPIconAssets.keypair),
      trailing: CommandBuilderAction(builder: builder),
      content: Column(
        children: [
          Row(
            children: [
              Text("Variable: ", style: theme.textTheme.bodyText1),
              TextFieldBuilderWidget<FindProgramAddressCommandBuilder>(
                style: SPLabelStyle.orange,
                adapter: TextFieldBuilderAdapter<FindProgramAddressCommandBuilder>(
                  builder: builder,
                  getTextBuilder: (builder) => builder.variable,
                  setTextBuilder: (builder, value) => builder.variable = value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
