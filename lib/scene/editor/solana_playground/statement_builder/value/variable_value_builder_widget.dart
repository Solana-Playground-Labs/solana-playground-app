import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class _VariableValueBuilderCubit extends Cubit<_VariableValueBuilderState> {
  final nameTextController = TextEditingController();
  final VariableValueBuilder builder;

  _VariableValueBuilderCubit(this.builder) : super(_VariableValueBuilderState()) {
    nameTextController.text = builder.variable;
    nameTextController.addListener(() {
      builder.variable = nameTextController.text;
    });
    builder.addListener(listener);
  }

  void listener() {
    if (nameTextController.text != builder.variable) {
      nameTextController.text = builder.variable;
    }
  }

  @override
  Future<void> close() async {
    nameTextController.dispose();
    builder.removeListener(listener);
    return super.close();
  }
}

class _VariableValueBuilderState extends Equatable {
  const _VariableValueBuilderState();

  @override
  List<Object> get props => [];
}

class VariableValueBuilderWidget extends CubitWidget<_VariableValueBuilderCubit, _VariableValueBuilderState> {
  final VariableValueBuilder builder;

  const VariableValueBuilderWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget content(BuildContext context, _VariableValueBuilderState state) {
    return SPLabel(
      style: SPLabelStyle.orange,
      child: TextField(
        controller: context.read<_VariableValueBuilderCubit>().nameTextController,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
        decoration: SPTextField.compactInputDecoration.copyWith(hintText: "Variable"),
      ),
    );
  }

  @override
  _VariableValueBuilderCubit cubit(BuildContext context) => _VariableValueBuilderCubit(builder);
}
