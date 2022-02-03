import 'package:flutter/material.dart';
import 'package:solana_playground_app/theme/playground_theme.dart';

import 'route/app_router.gr.dart';

class App extends StatelessWidget {
  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: PlaygroundTheme.dart(),
    );
  }
}
