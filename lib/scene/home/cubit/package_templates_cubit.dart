/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/model/package_template.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

part 'package_templates_state.dart';

final _assets = [
  "assets/projects/transfer.json",
  "assets/projects/orca_swap_sol_to_usdc_1.json",
];

class PackageTemplatesCubit extends Cubit<List<PackageTemplate>> {
  PackageTemplatesCubit() : super([]);

  initialize(BuildContext context) async {
    final List<PackageTemplate> templates = [];
    for (final path in _assets) {
      try {
        final data = await DefaultAssetBundle.of(context).loadString(path);
        templates.add(
          PackageTemplate(
            package: Package.fromJson(jsonDecode(data)),
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    emit(templates);
  }
}
