/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  final Widget header;
  final List<Widget> body;

  const Component({
    Key? key,
    required this.header,
    this.body = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header,
        if (body.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: body
                  .map(
                    (e) => [const ComponentConnectionWidget(), e],
                  )
                  .reduce((v, e) => [...v, ...e])
                  .toList(),
            ),
          )
      ],
    );
  }
}

class ComponentConnectionWidget extends StatelessWidget {
  const ComponentConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ComponentConnectionPainter(),
      child: const SizedBox(height: 16),
    );
  }
}

class _ComponentConnectionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(size.width / 2, 2.2);
    Offset endingPoint = Offset(size.width / 2, size.height);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
