import 'package:flutter/material.dart';

enum SPLabelStyle { blue, green, orange, purple }

Color _styleToColor(SPLabelStyle style) {
  switch (style) {
    case SPLabelStyle.blue:
      return const Color.fromRGBO(133, 183, 237, 1);
    case SPLabelStyle.green:
      return const Color.fromRGBO(112, 237, 157, 1);
    case SPLabelStyle.orange:
      return const Color.fromRGBO(255, 163, 97, 1);
    case SPLabelStyle.purple:
      return const Color.fromRGBO(206, 97, 236, 1.0);
  }
}

class SPLabel extends StatelessWidget {
  final SPLabelStyle style;
  final Widget child;

  const SPLabel({Key? key, this.style = SPLabelStyle.blue, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme
          .of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Colors.black),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: _styleToColor(style),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: child,
        ),
      ),
    );
  }
}
