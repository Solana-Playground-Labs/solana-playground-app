import 'package:flutter/material.dart';

class FocusListener extends StatelessWidget {
  final Widget child;
  final Function(bool)? onFocusChange;

  const FocusListener({Key? key, required this.child, this.onFocusChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: onFocusChange,
        child: child,
      ),
    );
  }
}
