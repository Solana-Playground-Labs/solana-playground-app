import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final Widget header;

  const HomeHeaderWidget({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: DefaultTextStyle(
        style: theme.textTheme.headline5!,
        child: header,
      ),
    );
  }
}
