import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/library/focuse_listener.dart';
import 'package:solana_playground_app/scene/editor/cubit/code_editor_cubit.dart';
import 'package:solana_playground_app/scene/editor/widget/model/value_souce.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/value/constant_value_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/value/input_builder_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/statement_builder/value/variable_value_builder_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class _ValueRootBuilderCubit extends Cubit<_ValueRootBuilderState> {
  final ValueRootBuilder builder;

  _ValueRootBuilderCubit(this.builder)
      : super(_ValueRootBuilderState(valueBuilder: builder.valueBuilder)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(valueBuilder: builder.valueBuilder));
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

class _ValueRootBuilderState extends Equatable {
  final ValueBuilder valueBuilder;

  const _ValueRootBuilderState({required this.valueBuilder});

  @override
  List<Object> get props => [valueBuilder];

  _ValueRootBuilderState copyWith({
    ValueBuilder? valueBuilder,
  }) {
    return _ValueRootBuilderState(
      valueBuilder: valueBuilder ?? this.valueBuilder,
    );
  }
}

class ValueRootBuilderWidget extends CubitWidget<_ValueRootBuilderCubit, _ValueRootBuilderState> {
  final ValueRootBuilder rootBuilder;

  const ValueRootBuilderWidget({Key? key, required this.rootBuilder}) : super(key: key);

  @override
  Widget content(BuildContext context, _ValueRootBuilderState state) {
    Widget child = Container();

    final builder = state.valueBuilder;
    if (builder is ConstantValueBuilder) {
      child = ConstantValueBuilderWidget(builder: builder);
    } else if (builder is VariableValueBuilder) {
      child = VariableValueBuilderWidget(builder: builder);
    } else if (builder is ReadValueBuilder) {
      child = InputValueBuilderWidget(builder: builder);
    }

    return FocusListener(
      onFocusChange: (value) {
        if (value) {
          context.read<CodeEditorCubit>().focus(rootBuilder);
        }
      },
      child: child,
    );
  }

  @override
  _ValueRootBuilderCubit cubit(BuildContext context) => _ValueRootBuilderCubit(rootBuilder);
}
