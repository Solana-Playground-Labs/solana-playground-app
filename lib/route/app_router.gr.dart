// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:solana_playground_language/solana_playground_language.dart'
    as _i14;

import '../common/transition/overlay.dart' as _i13;
import '../repository/wallet_repository.dart' as _i15;
import '../scene/editor_v2/editor_v2.dart' as _i16;
import '../scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart'
    as _i7;
import '../scene/editor_v2/view/color_picker_view.dart' as _i9;
import '../scene/editor_v2/view/editor_view.dart' as _i6;
import '../scene/editor_v2/view/icon_editor_view.dart' as _i8;
import '../scene/editor_v2/view/keypairs_list_view.dart' as _i10;
import '../scene/home/view/home_view.dart' as _i1;
import '../scene/wallet/view/airdrop_view.dart' as _i5;
import '../scene/wallet/view/create_wallet_view.dart' as _i2;
import '../scene/wallet/view/import_wallet_view.dart' as _i3;
import '../scene/wallet/view/wallet_detail_view.dart' as _i4;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    CreateWalletRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateWalletView());
    },
    ImportWalletRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ImportWalletView());
    },
    WalletDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.WalletDetailView(key: args.key, wallet: args.wallet));
    },
    AirdropRoute.name: (routeData) {
      final args = routeData.argsAs<AirdropRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.AirdropView(key: args.key, wallet: args.wallet));
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => const EditorRouteArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.EditorView(key: args.key));
    },
    ExpressionInspectorRoute.name: (routeData) {
      final args = routeData.argsAs<ExpressionInspectorRouteArgs>();
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.ExpressionInspectorView(
              key: args.key, builder: args.builder, metaData: args.metaData),
          customRouteBuilder: _i13.popover,
          opaque: true,
          barrierDismissible: false);
    },
    IconEditorRoute.name: (routeData) {
      final args = routeData.argsAs<IconEditorRouteArgs>();
      return _i11.CustomPage<_i14.SPIcon>(
          routeData: routeData,
          child: _i8.IconEditorView(key: args.key, initIcon: args.initIcon),
          customRouteBuilder: _i13.popover,
          opaque: true,
          barrierDismissible: false);
    },
    ColorPickerRoute.name: (routeData) {
      final args = routeData.argsAs<ColorPickerRouteArgs>();
      return _i11.CustomPage<_i12.Color>(
          routeData: routeData,
          child: _i9.ColorPickerView(key: args.key, initColor: args.initColor),
          customRouteBuilder: _i13.popover,
          opaque: true,
          barrierDismissible: false);
    },
    KeypairsListRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i10.KeypairsListView(),
          customRouteBuilder: _i13.popover,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(HomeRoute.name, path: '/'),
        _i11.RouteConfig(CreateWalletRoute.name, path: '/create-wallet-view'),
        _i11.RouteConfig(ImportWalletRoute.name, path: '/import-wallet-view'),
        _i11.RouteConfig(WalletDetailRoute.name, path: '/wallet-detail-view'),
        _i11.RouteConfig(AirdropRoute.name, path: '/airdrop-view'),
        _i11.RouteConfig(EditorRoute.name, path: '/editor-view'),
        _i11.RouteConfig(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view'),
        _i11.RouteConfig(IconEditorRoute.name, path: '/icon-editor-view'),
        _i11.RouteConfig(ColorPickerRoute.name, path: '/color-picker-view'),
        _i11.RouteConfig(KeypairsListRoute.name, path: '/keypairs-list-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateWalletView]
class CreateWalletRoute extends _i11.PageRouteInfo<void> {
  const CreateWalletRoute()
      : super(CreateWalletRoute.name, path: '/create-wallet-view');

  static const String name = 'CreateWalletRoute';
}

/// generated route for
/// [_i3.ImportWalletView]
class ImportWalletRoute extends _i11.PageRouteInfo<void> {
  const ImportWalletRoute()
      : super(ImportWalletRoute.name, path: '/import-wallet-view');

  static const String name = 'ImportWalletRoute';
}

/// generated route for
/// [_i4.WalletDetailView]
class WalletDetailRoute extends _i11.PageRouteInfo<WalletDetailRouteArgs> {
  WalletDetailRoute({_i12.Key? key, required _i15.Wallet wallet})
      : super(WalletDetailRoute.name,
            path: '/wallet-detail-view',
            args: WalletDetailRouteArgs(key: key, wallet: wallet));

  static const String name = 'WalletDetailRoute';
}

class WalletDetailRouteArgs {
  const WalletDetailRouteArgs({this.key, required this.wallet});

  final _i12.Key? key;

  final _i15.Wallet wallet;

  @override
  String toString() {
    return 'WalletDetailRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i5.AirdropView]
class AirdropRoute extends _i11.PageRouteInfo<AirdropRouteArgs> {
  AirdropRoute({_i12.Key? key, required _i15.Wallet wallet})
      : super(AirdropRoute.name,
            path: '/airdrop-view',
            args: AirdropRouteArgs(key: key, wallet: wallet));

  static const String name = 'AirdropRoute';
}

class AirdropRouteArgs {
  const AirdropRouteArgs({this.key, required this.wallet});

  final _i12.Key? key;

  final _i15.Wallet wallet;

  @override
  String toString() {
    return 'AirdropRouteArgs{key: $key, wallet: $wallet}';
  }
}

/// generated route for
/// [_i6.EditorView]
class EditorRoute extends _i11.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({_i12.Key? key})
      : super(EditorRoute.name,
            path: '/editor-view', args: EditorRouteArgs(key: key));

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ExpressionInspectorView]
class ExpressionInspectorRoute
    extends _i11.PageRouteInfo<ExpressionInspectorRouteArgs> {
  ExpressionInspectorRoute(
      {_i12.Key? key,
      required _i14.ExpressionBuilder builder,
      _i16.ExpressionMetaData? metaData})
      : super(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view',
            args: ExpressionInspectorRouteArgs(
                key: key, builder: builder, metaData: metaData));

  static const String name = 'ExpressionInspectorRoute';
}

class ExpressionInspectorRouteArgs {
  const ExpressionInspectorRouteArgs(
      {this.key, required this.builder, this.metaData});

  final _i12.Key? key;

  final _i14.ExpressionBuilder builder;

  final _i16.ExpressionMetaData? metaData;

  @override
  String toString() {
    return 'ExpressionInspectorRouteArgs{key: $key, builder: $builder, metaData: $metaData}';
  }
}

/// generated route for
/// [_i8.IconEditorView]
class IconEditorRoute extends _i11.PageRouteInfo<IconEditorRouteArgs> {
  IconEditorRoute({_i12.Key? key, required _i14.SPIcon initIcon})
      : super(IconEditorRoute.name,
            path: '/icon-editor-view',
            args: IconEditorRouteArgs(key: key, initIcon: initIcon));

  static const String name = 'IconEditorRoute';
}

class IconEditorRouteArgs {
  const IconEditorRouteArgs({this.key, required this.initIcon});

  final _i12.Key? key;

  final _i14.SPIcon initIcon;

  @override
  String toString() {
    return 'IconEditorRouteArgs{key: $key, initIcon: $initIcon}';
  }
}

/// generated route for
/// [_i9.ColorPickerView]
class ColorPickerRoute extends _i11.PageRouteInfo<ColorPickerRouteArgs> {
  ColorPickerRoute({_i12.Key? key, required _i12.Color initColor})
      : super(ColorPickerRoute.name,
            path: '/color-picker-view',
            args: ColorPickerRouteArgs(key: key, initColor: initColor));

  static const String name = 'ColorPickerRoute';
}

class ColorPickerRouteArgs {
  const ColorPickerRouteArgs({this.key, required this.initColor});

  final _i12.Key? key;

  final _i12.Color initColor;

  @override
  String toString() {
    return 'ColorPickerRouteArgs{key: $key, initColor: $initColor}';
  }
}

/// generated route for
/// [_i10.KeypairsListView]
class KeypairsListRoute extends _i11.PageRouteInfo<void> {
  const KeypairsListRoute()
      : super(KeypairsListRoute.name, path: '/keypairs-list-view');

  static const String name = 'KeypairsListRoute';
}
