// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../repository/wallet_repository.dart' as _i9;
import '../scene/editor/view/editor_view.dart' as _i6;
import '../scene/home/view/home_view.dart' as _i1;
import '../scene/wallet/view/airdrop_view.dart' as _i5;
import '../scene/wallet/view/create_wallet_view.dart' as _i2;
import '../scene/wallet/view/import_wallet_view.dart' as _i3;
import '../scene/wallet/view/wallet_detail_view.dart' as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    CreateWalletRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateWalletView());
    },
    ImportWalletRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ImportWalletView());
    },
    WalletDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.WalletDetailView(key: args.key, wallet: args.wallet));
    },
    AirdropRoute.name: (routeData) {
      final args = routeData.argsAs<AirdropRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.AirdropView(key: args.key, wallet: args.wallet));
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => const EditorRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.EditorView(key: args.key));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/'),
        _i7.RouteConfig(CreateWalletRoute.name, path: '/create-wallet-view'),
        _i7.RouteConfig(ImportWalletRoute.name, path: '/import-wallet-view'),
        _i7.RouteConfig(WalletDetailRoute.name, path: '/wallet-detail-view'),
        _i7.RouteConfig(AirdropRoute.name, path: '/airdrop-view'),
        _i7.RouteConfig(EditorRoute.name, path: '/editor-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateWalletView]
class CreateWalletRoute extends _i7.PageRouteInfo<void> {
  const CreateWalletRoute()
      : super(CreateWalletRoute.name, path: '/create-wallet-view');

  static const String name = 'CreateWalletRoute';
}

/// generated route for
/// [_i3.ImportWalletView]
class ImportWalletRoute extends _i7.PageRouteInfo<void> {
  const ImportWalletRoute()
      : super(ImportWalletRoute.name, path: '/import-wallet-view');

  static const String name = 'ImportWalletRoute';
}

/// generated route for
/// [_i4.WalletDetailView]
class WalletDetailRoute extends _i7.PageRouteInfo<WalletDetailRouteArgs> {
  WalletDetailRoute({_i8.Key? key, required _i9.Wallet wallet})
      : super(WalletDetailRoute.name,
            path: '/wallet-detail-view',
            args: WalletDetailRouteArgs(key: key, wallet: wallet));

  static const String name = 'WalletDetailRoute';
}

class WalletDetailRouteArgs {
  const WalletDetailRouteArgs({this.key, required this.wallet});

  final _i8.Key? key;

  final _i9.Wallet wallet;

  @override
  String toString() {
    return 'WalletDetailRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i5.AirdropView]
class AirdropRoute extends _i7.PageRouteInfo<AirdropRouteArgs> {
  AirdropRoute({_i8.Key? key, required _i9.Wallet wallet})
      : super(AirdropRoute.name,
            path: '/airdrop-view',
            args: AirdropRouteArgs(key: key, wallet: wallet));

  static const String name = 'AirdropRoute';
}

class AirdropRouteArgs {
  const AirdropRouteArgs({this.key, required this.wallet});

  final _i8.Key? key;

  final _i9.Wallet wallet;

  @override
  String toString() {
    return 'AirdropRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i6.EditorView]
class EditorRoute extends _i7.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({_i8.Key? key})
      : super(EditorRoute.name,
            path: '/editor-view', args: EditorRouteArgs(key: key));

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key}';
  }
}
