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

part 'string_utf8_value.builder.dart';

@ValueBuildable(displayName: "Utf8")
class StringUtf8Value extends Value {
  @ValuePropertyBuildable()
  final Expression expression;

  const StringUtf8Value({
    required this.expression,
  });

  @override
  List<Object> get props => [expression];

  factory StringUtf8Value.fromJson(Map<String, dynamic> json) {
    return _$StringUtf8ValueFromJson(json);
  }

  @override
  ValueBuilder asBuilder() {
    return _$StringUtf8ValueToBuilder(this);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StringUtf8ValueToJson(this);
  }

}