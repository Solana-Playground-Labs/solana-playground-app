import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

class _DeclareVariableInspectorCubit extends Cubit<_DeclareVariableInspectorState> {
  final DeclareVariableBuilder builder;

  _DeclareVariableInspectorCubit(this.builder)
      : super(_DeclareVariableInspectorState(
          internalType: builder.internalType,
        )) {
    builder.addListener(listener);
  }

  void listener() {
    emit(state.copyWith(internalType: builder.internalType));
  }

  void setInternalType(InternalType internalType) {
    builder.internalType = internalType;
  }

  void setSource() {}

  @override
  Future<void> close() {
    builder.removeListener(listener);
    return super.close();
  }
}

class _DeclareVariableInspectorState extends Equatable {
  final InternalType internalType;

  const _DeclareVariableInspectorState({required this.internalType});

  @override
  List<Object> get props => [internalType];

  _DeclareVariableInspectorState copyWith({InternalType? internalType}) {
    return _DeclareVariableInspectorState(internalType: internalType ?? this.internalType);
  }
}

class DeclareVariableInspectorWidget
    extends CubitWidget<_DeclareVariableInspectorCubit, _DeclareVariableInspectorState> {
  final DeclareVariableBuilder builder;

  DeclareVariableInspectorWidget({Key? key, required this.builder}) : super(key: Key(builder.id));

  @override
  Widget content(BuildContext context, _DeclareVariableInspectorState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text("Type:"),
          const SizedBox(height: 8),
          for (final internalType in InternalTypeHelper.primitives)
            ChoiceChip(
              label: Text(internalType.runtimeType.toString()),
              onSelected: (value) {
                context.read<_DeclareVariableInspectorCubit>().setInternalType(internalType);
              },
              selected: state.internalType == internalType,
            ),
        ],
      ),
    );
  }

  @override
  _DeclareVariableInspectorCubit cubit(BuildContext context) => _DeclareVariableInspectorCubit(builder);
}
