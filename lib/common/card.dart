import 'package:flutter/material.dart';

class SPCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final int level;

  SPCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.level = 1,
  }) : super(key: key);

  final Map<int, Color Function(BuildContext)> _levelMapping = {
    1: (context) => Theme.of(context).colorScheme.surface,
    2: (context) => const Color(0xFF606060),
    3: (context) => const Color(0xFF484848),
    4: (context) => const Color(0xFF989898),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color:
            _levelMapping[level]?.call(context) ?? _levelMapping[1]!(context),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
