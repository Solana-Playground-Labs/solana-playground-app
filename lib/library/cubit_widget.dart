import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitWidget<T extends Cubit<S>, S> extends StatelessWidget {
  const CubitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = cubit(context);

    if (_cubit == null) {
      return BlocBuilder<T, S>(
        buildWhen: buildWhen,
        builder: (context, state) {
          return content(context, state);
        },
      );
    }

    return BlocProvider(
      create: (context) => _cubit,
      child: Builder(
        builder: (context) =>
            BlocBuilder<T, S>(
              buildWhen: buildWhen,
              builder: (context, state) {
                return content(context, state);
              },
            ),
      ),
    );
  }

  T? cubit(BuildContext context) => null;

  Widget content(BuildContext context, S state);

  bool buildWhen(S p, S n) {
    return true;
  }
}
