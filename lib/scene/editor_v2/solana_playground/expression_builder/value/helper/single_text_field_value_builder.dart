/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/label.dart';
import 'package:solana_playground_app/common/textfield.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor_v2/editor_v2.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class SingleTextFieldValueBuilderCubit<T extends ValueBuilder>
    extends Cubit<String> {
  final SingleTextFieldValueBuilderAdapter<T> adapter;
  final textController = TextEditingController();

  SingleTextFieldValueBuilderCubit({required this.adapter})
      : super(adapter.getText()) {
    adapter.builder.addListener(listener);

    textController.text = adapter.getText();
    textController.addListener(() {
      adapter.setText(textController.text);
    });
  }

  void listener() {
    emit(adapter.getText());
    if (adapter.getText() != textController.text) {
      textController.text = adapter.getText();
    }
  }

  @override
  Future<void> close() async {
    textController.dispose();
    adapter.builder.removeListener(listener);
    return super.close();
  }
}

class SingleTextFieldValueBuilderWidget<T extends ValueBuilder>
    extends CubitWidget<SingleTextFieldValueBuilderCubit<T>, String> {
  final ExpressionMetaDataNode? metaData;
  final SingleTextFieldValueBuilderAdapter<T> adapter;
  final List<TextInputFormatter>? inputFormatters;

  const SingleTextFieldValueBuilderWidget({
    Key? key,
    required this.adapter,
    this.metaData,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget content(BuildContext context, String state) {
    return IntrinsicWidth(
      child: SPLabel(
        style: SPLabelStyle.green,
        child: TextField(
          controller: context
              .read<SingleTextFieldValueBuilderCubit<T>>()
              .textController,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.black),
          decoration:
              SPTextField.compactInputDecoration.copyWith(hintText: "Constant"),
          inputFormatters: inputFormatters ?? [],
        ),
      ),
    );
  }

  @override
  SingleTextFieldValueBuilderCubit<T> cubit(BuildContext context) =>
      SingleTextFieldValueBuilderCubit<T>(adapter: adapter);
}

class SingleTextFieldValueBuilderAdapter<T extends ValueBuilder> {
  final T builder;
  final String Function(T builder) _getTextBuilder;
  final void Function(T builder, String text) _setTextBuilder;

  const SingleTextFieldValueBuilderAdapter(
      {required this.builder,
      required String Function(T builder) getTextBuilder,
      required void Function(T builder, String text) setTextBuilder})
      : _getTextBuilder = getTextBuilder,
        _setTextBuilder = setTextBuilder;

  String getText() => _getTextBuilder(builder);

  void setText(String value) {
    _setTextBuilder(builder, value);
  }
}
