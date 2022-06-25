/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_app/repository/keypair_repository.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_app/scene/editor_v2/cubit/solana_network_cubit.dart';
import 'package:solana_playground_app/scene/home/cubit/package_templates_cubit.dart';
import 'package:solana_playground_app/theme/playground_theme.dart';

import 'route/app_router.gr.dart';

class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SolanaNetworkCubit>(
          create: (context) => SolanaNetworkCubit(),
        ),
        Provider<KeypairRepository>(
          create: (context) => KeypairRepository()..initialize(),
        ),
        Provider<PackageRepository>(create: (context) => PackageRepository()..initialize(context)),
        Provider<PackageTemplatesCubit>(
            create: (context) => PackageTemplatesCubit()..initialize(context)),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: PlaygroundTheme.light(),
      ),
    );
  }
}
