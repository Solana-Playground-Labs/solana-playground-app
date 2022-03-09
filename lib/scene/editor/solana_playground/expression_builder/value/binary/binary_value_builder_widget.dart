import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/model/focus_builder.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'binary_value_builder_cubit.dart';

class BinaryValueBuilderWidget
    extends CubitWidget<BinaryValueBuilderCubit, BinaryValueBuilderState> {
  final BinaryValueBuilder builder;

  BinaryValueBuilderWidget({Key? key, required this.builder})
      : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, BinaryValueBuilderState state) {
    return SPCard(
      level: 2,
      child: IntrinsicWidth(
        child: TextField(
          controller: context.read<BinaryValueBuilderCubit>().inputController,
          minLines: 1,
          maxLines: 99,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-fA-F0-9]")),
          ],
          decoration: SPTextField.compactInputDecoration.copyWith(
            hintText: "Hex data",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  BinaryValueBuilderCubit cubit(BuildContext context) =>
      BinaryValueBuilderCubit(builder);
}
