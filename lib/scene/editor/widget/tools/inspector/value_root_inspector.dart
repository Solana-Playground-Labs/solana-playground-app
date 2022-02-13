import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/editor/widget/model/value_souce.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class _ValueRootInspectorCubit extends Cubit<_ValueRootInspectorState> {
  final ValueContainerBuilder builder;

  _ValueRootInspectorCubit(this.builder)
      : super(_ValueRootInspectorState(sourceType: ValueSource.valueBuilderToSourceType(builder.valueBuilder))) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(sourceType: ValueSource.valueBuilderToSourceType(builder.valueBuilder)));
  }

  setSource(ValueSourceType sourceType) {
    builder.valueBuilder = ValueSource.sourceTypeToValueBuilder(sourceType);
  }

  @override
  Future<void> close() async {
    builder.removeListener(listener);
    return super.close();
  }
}

class _ValueRootInspectorState extends Equatable {
  final ValueSourceType sourceType;

  const _ValueRootInspectorState({required this.sourceType});

  @override
  List<Object> get props => [sourceType];

  _ValueRootInspectorState copyWith({
    ValueSourceType? sourceType,
  }) {
    return _ValueRootInspectorState(
      sourceType: sourceType ?? this.sourceType,
    );
  }
}

class ValueRootInspectorWidget extends CubitWidget<_ValueRootInspectorCubit, _ValueRootInspectorState> {
  final ValueContainerBuilder builder;

  ValueRootInspectorWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, _ValueRootInspectorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        const Text("Source:"),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final type in ValueSource.all)
              ChoiceChip(
                label: Text(ValueSource.sourceTypeToString(type)),
                selected: state.sourceType == type,
                onSelected: (value) {
                  if (value) {
                    context.read<_ValueRootInspectorCubit>().setSource(type);
                  }
                },
              ),
          ],
        ),
      ],
    );
  }

  @override
  _ValueRootInspectorCubit cubit(BuildContext context) => _ValueRootInspectorCubit(builder);
}
