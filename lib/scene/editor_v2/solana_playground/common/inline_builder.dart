/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_language/solana_playground_language.dart'
    as spl;

typedef InlineBuilderData<B extends spl.Builder, S> = S Function(B builder);

class InlineBuilderCubit<B extends spl.Builder, S> extends Cubit<S> {
  final B builder;
  final InlineBuilderData<B, S> data;

  InlineBuilderCubit({
    required this.builder,
    required this.data,
  }) : super(data(builder)) {
    builder.addListener(listener);
  }

  void listener() {
    emit(data(builder));
  }

  @override
  Future<void> close() {
    builder.removeListener(listener);
    return super.close();
  }
}

class InlineBuilder<B extends spl.Builder, S> extends StatelessWidget {
  final B builder;
  final InlineBuilderData<B, S> data;
  final Widget Function(BuildContext, S) widgetBuilder;

  const InlineBuilder({
    super.key,
    required this.builder,
    required this.data,
    required this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InlineBuilderCubit<B, S>>(
      create: (_) => InlineBuilderCubit<B, S>(builder: builder, data: data),
      child: BlocBuilder<InlineBuilderCubit<B, S>, S>(
        builder: (context, state) {
          return widgetBuilder(context, state);
        },
      ),
    );
  }
}
