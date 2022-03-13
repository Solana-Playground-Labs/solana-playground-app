// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../scene/editor/view/editor_view.dart' as _i4;
import '../scene/home/view/home_view.dart' as _i1;
import '../scene/wallet/view/create_wallet_view.dart' as _i2;
import '../scene/wallet/view/import_wallet_view.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    CreateWalletRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateWalletView());
    },
    ImportWalletRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ImportWalletView());
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => const EditorRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.EditorView(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/'),
        _i5.RouteConfig(CreateWalletRoute.name, path: '/create-wallet-view'),
        _i5.RouteConfig(ImportWalletRoute.name, path: '/import-wallet-view'),
        _i5.RouteConfig(EditorRoute.name, path: '/editor-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateWalletView]
class CreateWalletRoute extends _i5.PageRouteInfo<void> {
  const CreateWalletRoute()
      : super(CreateWalletRoute.name, path: '/create-wallet-view');

  static const String name = 'CreateWalletRoute';
}

/// generated route for
/// [_i3.ImportWalletView]
class ImportWalletRoute extends _i5.PageRouteInfo<void> {
  const ImportWalletRoute()
      : super(ImportWalletRoute.name, path: '/import-wallet-view');

  static const String name = 'ImportWalletRoute';
}

/// generated route for
/// [_i4.EditorView]
class EditorRoute extends _i5.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({_i6.Key? key})
      : super(EditorRoute.name,
            path: '/editor-view', args: EditorRouteArgs(key: key));

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key}';
  }
}
