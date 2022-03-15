/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/home/cubit/packages_cubit.dart';
import 'package:collection/collection.dart';
import 'package:solana_playground_language/lib.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                var i = 1;
                var name = "Demo 1";
                while (state.packages
                        .firstWhereOrNull((element) => element.name == name) !=
                    null) {
                  i++;
                  name = "Demo $i";
                }

                context.read<PackageRepository>().createPackage(name);
              },
              title: const Text("New project"),
            ),
            const Divider(),
            ...state.packages.map((e) {
              return Column(
                children: [
                  ListTile(
                    title: Text(e.name),
                    onTap: () async {
                      final result = await context.router.push(EditorRoute(initialPackage: e));
                      if (result is Package) {
                        context.read<PackageRepository>().save(result);
                      }
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () async {
                        final data = jsonEncode(e.toJson());
                        await Clipboard.setData(ClipboardData(text: data));
                      },
                    ),
                  ),
                  const Divider(),
                ],
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
