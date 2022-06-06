/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerView extends StatelessWidget {
  final Color initColor;

  const ColorPickerView({Key? key, required this.initColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color picker")),
      body: MaterialPicker(
        pickerColor: initColor,
        onColorChanged: (color) {
          context.router.pop(color);
        },
      ),
    );
  }
}
