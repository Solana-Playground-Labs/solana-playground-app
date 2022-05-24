/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'bool_meta_value_cubit.dart';

class BoolMetaValueWidget
    extends CubitWidget<BoolMetaValueCubit, BoolMetaValueState> {
  final BoolMetaValueBuilder builder;
  final String? title;

  BoolMetaValueWidget({Key? key, required this.builder, this.title})
      : super(key: Key(builder.builder.id));

  @override
  Widget content(BuildContext context, BoolMetaValueState state) {
    return Container(
      clipBehavior: Clip.hardEdge,
      constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
      decoration: BoxDecoration(
        color: state.value ? Colors.purple : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            context.read<BoolMetaValueCubit>().toggle();
          },
          child: Center(
              child:
                  Text(title ?? "T", style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }

  @override
  BoolMetaValueCubit cubit(BuildContext context) => BoolMetaValueCubit(builder);
}
