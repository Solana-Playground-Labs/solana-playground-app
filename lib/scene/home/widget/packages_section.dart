/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

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
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return const NewPackageCell();
              }

              final package = state.packages[index - 1];
              return PackageCell(
                package: package,
                onTap: () {
                  context.router.push(
                    EditorRoute(
                      packageEditController: PackageEditController.parse(
                        package,
                        packageRepository: context.read(),
                      ),
                    ),
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
        context.router.push(CreatePackageRoute());
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          context
                              .read<PackageRepository>()
                              .remove(package.name);
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
              Expanded(
                child: Text(
                  package.name,
                  maxLines: 3,
                  style: theme.textTheme.bodyText1?.apply(
                    color: Color(package.icon.foregroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
