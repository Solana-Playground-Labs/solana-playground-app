import 'package:flutter/material.dart';

enum PGLabelStyle { blue, green, orange, purple }

Color _styleToColor(PGLabelStyle style) {
  switch (style) {
    case PGLabelStyle.blue:
      return const Color.fromRGBO(133, 183, 237, 1);
    case PGLabelStyle.green:
      return const Color.fromRGBO(112, 237, 157, 1);
    case PGLabelStyle.orange:
      return const Color.fromRGBO(255, 163, 97, 1);
    case PGLabelStyle.purple:
      return const Color.fromRGBO(206, 97, 236, 1.0);
  }
}

class PGLabel extends StatelessWidget {
  final PGLabelStyle style;
  final Widget child;

  const PGLabel({Key? key, this.style = PGLabelStyle.blue, required this.child}) : super(key: key);

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
