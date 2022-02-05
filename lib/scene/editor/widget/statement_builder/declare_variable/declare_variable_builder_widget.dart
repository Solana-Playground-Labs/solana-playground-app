import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/focuse_listener.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/value/value_root_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

import 'declare_variable_builder_cubit.dart';

class DeclareVariableBuilderWidget extends StatelessWidget {
  final DeclareVariableBuilder builder;

  DeclareVariableBuilderWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeclareVariableBuilderCubit>(
      create: (context) => DeclareVariableBuilderCubit(builder),
      child: Builder(
        builder: (context) => content(context),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IntrinsicWidth(
          child: SPLabel(
            style: SPLabelStyle.orange,
            child: FocusListener(
              onFocusChange: (focus) {
                if (focus) context.read<CodeEditorCubit>().focus(builder);
              },
              child: TextField(
                controller: context.read<DeclareVariableBuilderCubit>().nameTextController,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
                decoration: SPTextField.compactInputDecoration.copyWith(hintText: "Variable"),
              ),
            ),
          ),
        ),
        BlocBuilder<DeclareVariableBuilderCubit, DeclareVariableBuilderState>(
          builder: (context, state) {
            if (state.internalType is InternalString) {
              return const Text(" : String");
            } else if (state.internalType is InternalBool) {
              return const Text(" : Bool");
            } else if (state.internalType is InternalNumber) {
              return const Text(" : Number");
            }
            return Container();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset("assets/icon/equal.svg"),
        ),
        IntrinsicWidth(
          child: ValueRootBuilderWidget(rootBuilder: builder.valueRootBuilder),
        ),
      ],
    );
  }
}
