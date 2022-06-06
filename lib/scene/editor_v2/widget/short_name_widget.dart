/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/route/app_router.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/package_cubit.dart';
import 'package:solana_playground_language/lib.dart';

class SPPackageIconWidget extends StatelessWidget {
  const SPPackageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PackageNameCubit, PackageNameState>(
        buildWhen: (p, n) => p.icon != n.icon,
        builder: (context, state) {
          return Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () async {
                final cubit = context.read<PackageNameCubit>();
                final result = await context.router
                    .push<SPIcon>(IconEditorRoute(initIcon: state.icon));
                if (result != null) cubit.updateIcon(result);
              },
              child: SPIconWidget(icon: state.icon),
            ),
          );
        },
      ),
    );
  }
}

class SPIconWidget extends StatelessWidget {
  final SPIcon icon;

  const SPIconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Color(icon.backgroundColor)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 46,
        height: 46,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(icon.backgroundColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: FittedBox(
          child: Text(
            icon.shortName,
            style: TextStyle(
              color: Color(icon.foregroundColor),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
