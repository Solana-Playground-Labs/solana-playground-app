// Solana Playground
// Copyright (C) 2022 Tran Giang Long
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/model/package_edit_controller.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/cubit/packages_cubit.dart';
import 'package:collection/collection.dart';
import 'package:solana_playground_language/lib.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<PackagesCubit, PackagesState>(
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
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const NewPackageCell();
              }

              final package = state.packages[index - 1];
              return PackageCell(
                package: package,
                onTap: () async {
                  context.router.push(
                    EditorRoute(packageBuilder: package.asBuilder()),
                  );
                },
              );
            },
            itemCount: state.packages.length + 1,
          ),
        );
      },
    );
  }
}

class NewPackageCell extends StatelessWidget {
  const NewPackageCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Package"),
              content: const Text("Choose your action"),
              actions: [
                TextButton(
                    onPressed: () async {
                      await context.popRoute();
                      context.router.push(CreatePackageRoute());
                    },
                    child: const Text("New")),
                TextButton(
                    onPressed: () async {
                      await context.popRoute();
                      context.router.push(const ImportPackageRoute());
                    },
                    child: const Text("Import")),
                TextButton(onPressed: () => context.popRoute(), child: const Text("Cancel")),
              ],
            );
          },
        );
      },
      child: DottedBorder(
        strokeWidth: 1,
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [6, 2],
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("New package"),
          ),
        ),
      ),
    );
  }
}

class PackageCell extends StatelessWidget {
  final VoidCallback? onTap;

  const PackageCell({
    Key? key,
    required this.package,
    this.onTap,
  }) : super(key: key);

  final Package package;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SPCard(
      padding: const EdgeInsets.all(0),
      color: Color(package.icon.backgroundColor),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    package.icon.shortName,
                    style: theme.textTheme.headline5?.apply(
                      color: Color(package.icon.foregroundColor),
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: const Text("Delete"),
                        onTap: () {
                          context.read<PackageRepository>().remove(package.name);
                        },
                      )
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: Color(package.icon.foregroundColor),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                package.name,
                maxLines: 3,
                style: theme.textTheme.bodyText1?.apply(
                  color: Color(package.icon.foregroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
