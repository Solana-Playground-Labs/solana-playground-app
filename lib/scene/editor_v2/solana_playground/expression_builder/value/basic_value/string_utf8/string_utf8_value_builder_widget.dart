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
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/lib.dart';

class StringUtf8ValueBuilderWidget extends StatelessWidget {
  final StringUtf8ValueBuilder builder;

  StringUtf8ValueBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return ExpressionBuilderWidget(builder: builder.expression);
  }
}
