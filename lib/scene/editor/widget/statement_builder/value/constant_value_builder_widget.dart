import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class _ConstantValueBuilderCubit extends Cubit<_ConstantValueBuilderState> {
  final ConstantValueBuilder builder;
  final TextEditingController constantTextController = TextEditingController();

  _ConstantValueBuilderCubit(this.builder) : super(_ConstantValueBuilderState(constant: builder.constant)) {
    builder.addListener(listener);

    constantTextController.text = builder.constant;
    constantTextController.addListener(() {
      builder.constant = constantTextController.text;
    });
  }

  void listener() {
    if (constantTextController.text != builder.constant) {
      constantTextController.text = builder.constant;
    }
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    constantTextController.dispose();
    return super.close();
  }
}

class _ConstantValueBuilderState extends Equatable {
  final String constant;

  const _ConstantValueBuilderState({required this.constant});

  @override
  List<Object> get props => [constant];

  _ConstantValueBuilderState copyWith({
    String? constant,
  }) {
    return _ConstantValueBuilderState(
      constant: constant ?? this.constant,
    );
  }
}

class ConstantValueBuilderWidget extends CubitWidget<_ConstantValueBuilderCubit, _ConstantValueBuilderState> {
  final ConstantValueBuilder builder;

  const ConstantValueBuilderWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget content(BuildContext context, _ConstantValueBuilderState state) {
    return SPLabel(
      style: SPLabelStyle.green,
      child: TextField(
        maxLines: 1,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
        decoration: SPTextField.compactInputDecoration.copyWith(hintText: "Constant"),
      ),
    );
  }

  @override
  _ConstantValueBuilderCubit cubit(BuildContext context) => _ConstantValueBuilderCubit(builder);
}
