/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_app/theme/icons.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'conditional_wrapper_value_builder_cubit.dart';

class ConditionalWrapperValueBuilderWidget extends CubitWidget<
    ConditionalWrapperValueBuilderCubit, ConditionalWrapperValueBuilderState> {
  final ExpressionMetaDataNode? metaData;
  final ConditionalWrapperValueBuilder builder;

  ConditionalWrapperValueBuilderWidget({
    Key? key,
    this.metaData,
    required this.builder,
  }) : super(key: Key(builder.id));

  @override
  Widget content(
    BuildContext context,
    ConditionalWrapperValueBuilderState state,
  ) {
    return Component(
      header: ComponentHeader(
        name: metaData?.index == null
            ? "Conditional wrapper"
            : "Conditional wrapper #${metaData!.index! + 1}",
        content: ExpressionBuilderWidget(
          builder: builder.condition,
          metaData: const ExpressionMetaDataNode(changeable: false),
        ),
        trailing: metaData?.index != null
            ? ListValueActions(
                builder: builder,
                actions: (_) {
                  return [
                    ConditionalWrapperAction.asUnwrapListAction(context, builder, true),
                    // ConditionalWrapperAction.asUnwrapListAction(context, builder, false),
                  ];
                },
              )
            : null,
      ),
      body: [
        Component(
          header: ComponentHeader(
            name: "If condition is true",
            icon: SvgPicture.asset(SPIconAssets.trueIcon),
          ),
          body: [
            ExpressionBuilderWidget(
              builder: builder.trueFlow,
              metaData: const ExpressionMetaDataNode(changeable: false),
            ),
          ],
        ),
        // Component(
        //   header: ComponentBody(
        //     name: "If condition is false",
        //     icon: SvgPicture.asset(SPIcons.falseIcon),
        //   ),
        //   body: [
        //     ExpressionBuilderWidget(
        //       builder: builder.falseFlow,
        //       metaData: const ExpressionMetaDataNode(changeable: false),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  @override
  ConditionalWrapperValueBuilderCubit cubit(BuildContext context) =>
      ConditionalWrapperValueBuilderCubit(builder);
}
