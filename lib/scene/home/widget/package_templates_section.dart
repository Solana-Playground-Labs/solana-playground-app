/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/model/package_template.dart';
import 'package:solana_playground_app/route/app_router.dart';
import 'package:solana_playground_app/scene/home/cubit/package_templates_cubit.dart';

import 'packages_section.dart';

class PackageTemplatesSection extends StatelessWidget {
  const PackageTemplatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageTemplatesCubit, List<PackageTemplate>>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              mainAxisExtent: 100,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final package = state[index].package;
              return PackageCell(
                package: package,
                onTap: () {
                  context.router.push(
                    CreatePackageRoute(template: state[index]),
                  );
                },
              );
            },
            itemCount: state.length,
          ),
        );
      },
    );
  }
}
