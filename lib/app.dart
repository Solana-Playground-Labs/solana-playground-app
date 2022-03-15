/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:solana/solana.dart';
import 'package:solana_playground_app/repository/package_repository.dart';
import 'package:solana_playground_app/theme/playground_theme.dart';

import 'repository/wallet_repository.dart';
import 'route/app_router.gr.dart';

class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SolanaClient>(
          create: (context) => SolanaClient(
            rpcUrl: Uri.parse("https://api.devnet.solana.com"),
            websocketUrl: Uri.parse("ws://api.devnet.solana.com"),
          ),
        ),
        Provider<WalletRepository>(
          create: (context) => WalletRepository()..initialize(),
        ),
        Provider<PackageRepository>(
            create: (context) => PackageRepository()..initialize(context))
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: PlaygroundTheme.dart(),
      ),
    );
  }
}
