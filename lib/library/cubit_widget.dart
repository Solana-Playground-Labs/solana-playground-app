import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitWidget<T extends Cubit<S>, S> extends StatelessWidget {
  const CubitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit(context),
      child: Builder(
        builder: (context) => BlocBuilder<T, S>(
          builder: (context, state) {
            return content(context, state);
          },
        ),
      ),
    );
  }

  T cubit(BuildContext context);

  Widget content(BuildContext context, S state);
}
