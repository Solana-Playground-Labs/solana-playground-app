// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:solana_playground_language/solana_playground_language.dart'
    as _i12;

import '../common/transition/overlay.dart' as _i10;
import '../repository/wallet_repository.dart' as _i11;
import '../scene/editor_v2/editor_v2.dart' as _i13;
import '../scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart'
    as _i7;
import '../scene/editor_v2/view/editor_view.dart' as _i6;
import '../scene/home/view/home_view.dart' as _i1;
import '../scene/wallet/view/airdrop_view.dart' as _i5;
import '../scene/wallet/view/create_wallet_view.dart' as _i2;
import '../scene/wallet/view/import_wallet_view.dart' as _i3;
import '../scene/wallet/view/wallet_detail_view.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    CreateWalletRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateWalletView());
    },
    ImportWalletRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ImportWalletView());
    },
    WalletDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.WalletDetailView(key: args.key, wallet: args.wallet));
    },
    AirdropRoute.name: (routeData) {
      final args = routeData.argsAs<AirdropRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.AirdropView(key: args.key, wallet: args.wallet));
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => const EditorRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.EditorView(key: args.key));
    },
    ExpressionInspectorRoute.name: (routeData) {
      final args = routeData.argsAs<ExpressionInspectorRouteArgs>();
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.ExpressionInspectorView(
              key: args.key, builder: args.builder, metaData: args.metaData),
          customRouteBuilder: _i10.popover,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(HomeRoute.name, path: '/home-view'),
        _i8.RouteConfig(CreateWalletRoute.name, path: '/create-wallet-view'),
        _i8.RouteConfig(ImportWalletRoute.name, path: '/import-wallet-view'),
        _i8.RouteConfig(WalletDetailRoute.name, path: '/wallet-detail-view'),
        _i8.RouteConfig(AirdropRoute.name, path: '/airdrop-view'),
        _i8.RouteConfig(EditorRoute.name, path: '/'),
        _i8.RouteConfig(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-view');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateWalletView]
class CreateWalletRoute extends _i8.PageRouteInfo<void> {
  const CreateWalletRoute()
      : super(CreateWalletRoute.name, path: '/create-wallet-view');

  static const String name = 'CreateWalletRoute';
}

/// generated route for
/// [_i3.ImportWalletView]
class ImportWalletRoute extends _i8.PageRouteInfo<void> {
  const ImportWalletRoute()
      : super(ImportWalletRoute.name, path: '/import-wallet-view');

  static const String name = 'ImportWalletRoute';
}

/// generated route for
/// [_i4.WalletDetailView]
class WalletDetailRoute extends _i8.PageRouteInfo<WalletDetailRouteArgs> {
  WalletDetailRoute({_i9.Key? key, required _i11.Wallet wallet})
      : super(WalletDetailRoute.name,
            path: '/wallet-detail-view',
            args: WalletDetailRouteArgs(key: key, wallet: wallet));

  static const String name = 'WalletDetailRoute';
}

class WalletDetailRouteArgs {
  const WalletDetailRouteArgs({this.key, required this.wallet});

  final _i9.Key? key;

  final _i11.Wallet wallet;

  @override
  String toString() {
    return 'WalletDetailRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i5.AirdropView]
class AirdropRoute extends _i8.PageRouteInfo<AirdropRouteArgs> {
  AirdropRoute({_i9.Key? key, required _i11.Wallet wallet})
      : super(AirdropRoute.name,
            path: '/airdrop-view',
            args: AirdropRouteArgs(key: key, wallet: wallet));

  static const String name = 'AirdropRoute';
}

class AirdropRouteArgs {
  const AirdropRouteArgs({this.key, required this.wallet});

  final _i9.Key? key;

  final _i11.Wallet wallet;

  @override
  String toString() {
    return 'AirdropRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i6.EditorView]
class EditorRoute extends _i8.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({_i9.Key? key})
      : super(EditorRoute.name, path: '/', args: EditorRouteArgs(key: key));

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ExpressionInspectorView]
class ExpressionInspectorRoute
    extends _i8.PageRouteInfo<ExpressionInspectorRouteArgs> {
  ExpressionInspectorRoute(
      {_i9.Key? key,
      required _i12.ExpressionBuilder builder,
      _i13.ExpressionMetaData? metaData})
      : super(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view',
            args: ExpressionInspectorRouteArgs(
                key: key, builder: builder, metaData: metaData));

  static const String name = 'ExpressionInspectorRoute';
}

class ExpressionInspectorRouteArgs {
  const ExpressionInspectorRouteArgs(
      {this.key, required this.builder, this.metaData});

  final _i9.Key? key;

  final _i12.ExpressionBuilder builder;

  final _i13.ExpressionMetaData? metaData;

  @override
  String toString() {
    return 'ExpressionInspectorRouteArgs{key: $key, builder: $builder, metaData: $metaData}';
  }
}
