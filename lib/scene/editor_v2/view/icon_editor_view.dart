/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solana_playground_app/route/app_router.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/icon_cubit.dart';
import 'package:solana_playground_app/scene/editor_v2/widget/short_name_widget.dart';
import 'package:solana_playground_language/lib.dart' hide Builder;

class IconEditorView extends StatelessWidget {
  final SPIcon initIcon;

  const IconEditorView({Key? key, required this.initIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => IconCubit(initIcon))],
      child: Builder(builder: (context) => content(context)),
    );
  }

  Widget content(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon edit"),
        actions: [
          IconButton(
            onPressed: () {
              context.router.pop(context.read<IconCubit>().state);
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<IconCubit, SPIcon>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SPIconWidget(icon: state),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: context.read<IconCubit>().shortNameInput,
                    maxLength: 3,
                    decoration: const InputDecoration(hintText: "Short name"),
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 16),
                Text(
                  "Foreground color: ",
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: 8),
                BlockPicker(
                  pickerColor: Color(state.foregroundColor),
                  availableColors: _defaultColors,
                  onColorChanged: (color) {
                    context.read<IconCubit>().updateForeground(color);
                  },
                ),
                const SizedBox(height: 16),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 16),
                Text(
                  "Background color: ",
                  style: theme.textTheme.bodyText1,
                ),
                const SizedBox(height: 8),
                BlockPicker(
                  pickerColor: Color(state.backgroundColor),
                  availableColors: _defaultColors,
                  onColorChanged: (color) {
                    context.read<IconCubit>().updateBackground(color);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

const List<Color> _defaultColors = [
  Colors.white,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];
