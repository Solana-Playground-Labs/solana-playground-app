// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:solana_playground_language/solana_playground_language.dart'
    as _i17;

import '../common/transition/overlay.dart' as _i16;
import '../model/keypair.dart' as _i18;
import '../model/package_template.dart' as _i19;
import '../scene/editor_v2/editor_v2.dart' as _i20;
import '../scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart'
    as _i10;
import '../scene/editor_v2/view/color_picker_view.dart' as _i12;
import '../scene/editor_v2/view/editor_view.dart' as _i7;
import '../scene/editor_v2/view/icon_editor_view.dart' as _i11;
import '../scene/editor_v2/view/keypairs_list_view.dart' as _i13;
import '../scene/editor_v2/view/runtime_view.dart' as _i8;
import '../scene/home/view/create_package_view.dart' as _i9;
import '../scene/home/view/home_view.dart' as _i1;
import '../scene/home/view/import_package_view.dart' as _i4;
import '../scene/wallet/view/airdrop_view.dart' as _i6;
import '../scene/wallet/view/create_wallet_view.dart' as _i2;
import '../scene/wallet/view/import_wallet_view.dart' as _i3;
import '../scene/wallet/view/wallet_detail_view.dart' as _i5;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    CreateKeyPairRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.CreateKeyPairView(),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    ImportWalletRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.ImportWalletView(),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    ImportPackageRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ImportPackageView(),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    WalletDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.WalletDetailView(key: args.key, keypair: args.keypair),
          customRouteBuilder: _i16.popoverWide,
          opaque: true,
          barrierDismissible: false);
    },
    AirdropRoute.name: (routeData) {
      final args = routeData.argsAs<AirdropRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.AirdropView(key: args.key, keypair: args.keypair),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    EditorRoute.name: (routeData) {
      final args = routeData.argsAs<EditorRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.EditorView(
              key: args.key, packageBuilder: args.packageBuilder));
    },
    RuntimeRoute.name: (routeData) {
      final args = routeData.argsAs<RuntimeRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.RuntimeView(
              key: args.key, package: args.package, autoRun: args.autoRun),
          customRouteBuilder: _i16.popoverWide,
          opaque: true,
          barrierDismissible: false);
    },
    CreatePackageRoute.name: (routeData) {
      final args = routeData.argsAs<CreatePackageRouteArgs>(
          orElse: () => const CreatePackageRouteArgs());
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.CreatePackageView(key: args.key, template: args.template),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    ExpressionInspectorRoute.name: (routeData) {
      final args = routeData.argsAs<ExpressionInspectorRouteArgs>();
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.ExpressionInspectorView(
              key: args.key, builder: args.builder, metaData: args.metaData),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    IconEditorRoute.name: (routeData) {
      final args = routeData.argsAs<IconEditorRouteArgs>();
      return _i14.CustomPage<_i17.SPIcon>(
          routeData: routeData,
          child: _i11.IconEditorView(key: args.key, initIcon: args.initIcon),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    ColorPickerRoute.name: (routeData) {
      final args = routeData.argsAs<ColorPickerRouteArgs>();
      return _i14.CustomPage<_i15.Color>(
          routeData: routeData,
          child: _i12.ColorPickerView(key: args.key, initColor: args.initColor),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    },
    KeypairsListRoute.name: (routeData) {
      return _i14.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i13.KeypairsListView(),
          customRouteBuilder: _i16.popover,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(HomeRoute.name, path: '/'),
        _i14.RouteConfig(CreateKeyPairRoute.name,
            path: '/create-key-pair-view'),
        _i14.RouteConfig(ImportWalletRoute.name, path: '/import-wallet-view'),
        _i14.RouteConfig(ImportPackageRoute.name, path: '/import-package-view'),
        _i14.RouteConfig(WalletDetailRoute.name, path: '/wallet-detail-view'),
        _i14.RouteConfig(AirdropRoute.name, path: '/airdrop-view'),
        _i14.RouteConfig(EditorRoute.name, path: '/editor-view'),
        _i14.RouteConfig(RuntimeRoute.name, path: '/runtime-view'),
        _i14.RouteConfig(CreatePackageRoute.name, path: '/create-package-view'),
        _i14.RouteConfig(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view'),
        _i14.RouteConfig(IconEditorRoute.name, path: '/icon-editor-view'),
        _i14.RouteConfig(ColorPickerRoute.name, path: '/color-picker-view'),
        _i14.RouteConfig(KeypairsListRoute.name, path: '/keypairs-list-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CreateKeyPairView]
class CreateKeyPairRoute extends _i14.PageRouteInfo<void> {
  const CreateKeyPairRoute()
      : super(CreateKeyPairRoute.name, path: '/create-key-pair-view');

  static const String name = 'CreateKeyPairRoute';
}

/// generated route for
/// [_i3.ImportWalletView]
class ImportWalletRoute extends _i14.PageRouteInfo<void> {
  const ImportWalletRoute()
      : super(ImportWalletRoute.name, path: '/import-wallet-view');

  static const String name = 'ImportWalletRoute';
}

/// generated route for
/// [_i4.ImportPackageView]
class ImportPackageRoute extends _i14.PageRouteInfo<void> {
  const ImportPackageRoute()
      : super(ImportPackageRoute.name, path: '/import-package-view');

  static const String name = 'ImportPackageRoute';
}

/// generated route for
/// [_i5.WalletDetailView]
class WalletDetailRoute extends _i14.PageRouteInfo<WalletDetailRouteArgs> {
  WalletDetailRoute({_i15.Key? key, required _i18.Keypair keypair})
      : super(WalletDetailRoute.name,
            path: '/wallet-detail-view',
            args: WalletDetailRouteArgs(key: key, keypair: keypair));

  static const String name = 'WalletDetailRoute';
}

class WalletDetailRouteArgs {
  const WalletDetailRouteArgs({this.key, required this.keypair});

  final _i15.Key? key;

  final _i18.Keypair keypair;

  @override
  String toString() {
    return 'WalletDetailRouteArgs{key: $key, keypair: $keypair}';
  }
}

/// generated route for
/// [_i6.AirdropView]
class AirdropRoute extends _i14.PageRouteInfo<AirdropRouteArgs> {
  AirdropRoute({_i15.Key? key, required _i18.Keypair keypair})
      : super(AirdropRoute.name,
            path: '/airdrop-view',
            args: AirdropRouteArgs(key: key, keypair: keypair));

  static const String name = 'AirdropRoute';
}

class AirdropRouteArgs {
  const AirdropRouteArgs({this.key, required this.keypair});

  final _i15.Key? key;

  final _i18.Keypair keypair;

  @override
  String toString() {
    return 'AirdropRouteArgs{key: $key, keypair: $keypair}';
  }
}

/// generated route for
/// [_i7.EditorView]
class EditorRoute extends _i14.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({_i15.Key? key, required _i17.PackageBuilder packageBuilder})
      : super(EditorRoute.name,
            path: '/editor-view',
            args: EditorRouteArgs(key: key, packageBuilder: packageBuilder));

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({this.key, required this.packageBuilder});

  final _i15.Key? key;

  final _i17.PackageBuilder packageBuilder;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key, packageBuilder: $packageBuilder}';
  }
}

/// generated route for
/// [_i8.RuntimeView]
class RuntimeRoute extends _i14.PageRouteInfo<RuntimeRouteArgs> {
  RuntimeRoute(
      {_i15.Key? key, required _i17.Package package, bool autoRun = true})
      : super(RuntimeRoute.name,
            path: '/runtime-view',
            args:
                RuntimeRouteArgs(key: key, package: package, autoRun: autoRun));

  static const String name = 'RuntimeRoute';
}

class RuntimeRouteArgs {
  const RuntimeRouteArgs(
      {this.key, required this.package, this.autoRun = true});

  final _i15.Key? key;

  final _i17.Package package;

  final bool autoRun;

  @override
  String toString() {
    return 'RuntimeRouteArgs{key: $key, package: $package, autoRun: $autoRun}';
  }
}

/// generated route for
/// [_i9.CreatePackageView]
class CreatePackageRoute extends _i14.PageRouteInfo<CreatePackageRouteArgs> {
  CreatePackageRoute({_i15.Key? key, _i19.PackageTemplate? template})
      : super(CreatePackageRoute.name,
            path: '/create-package-view',
            args: CreatePackageRouteArgs(key: key, template: template));

  static const String name = 'CreatePackageRoute';
}

class CreatePackageRouteArgs {
  const CreatePackageRouteArgs({this.key, this.template});

  final _i15.Key? key;

  final _i19.PackageTemplate? template;

  @override
  String toString() {
    return 'CreatePackageRouteArgs{key: $key, template: $template}';
  }
}

/// generated route for
/// [_i10.ExpressionInspectorView]
class ExpressionInspectorRoute
    extends _i14.PageRouteInfo<ExpressionInspectorRouteArgs> {
  ExpressionInspectorRoute(
      {_i15.Key? key,
      required _i17.ExpressionBuilder builder,
      _i20.ExpressionMetaData? metaData})
      : super(ExpressionInspectorRoute.name,
            path: '/expression-inspector-view',
            args: ExpressionInspectorRouteArgs(
                key: key, builder: builder, metaData: metaData));

  static const String name = 'ExpressionInspectorRoute';
}

class ExpressionInspectorRouteArgs {
  const ExpressionInspectorRouteArgs(
      {this.key, required this.builder, this.metaData});

  final _i15.Key? key;

  final _i17.ExpressionBuilder builder;

  final _i20.ExpressionMetaData? metaData;

  @override
  String toString() {
    return 'ExpressionInspectorRouteArgs{key: $key, builder: $builder, metaData: $metaData}';
  }
}

/// generated route for
/// [_i11.IconEditorView]
class IconEditorRoute extends _i14.PageRouteInfo<IconEditorRouteArgs> {
  IconEditorRoute({_i15.Key? key, required _i17.SPIcon initIcon})
      : super(IconEditorRoute.name,
            path: '/icon-editor-view',
            args: IconEditorRouteArgs(key: key, initIcon: initIcon));

  static const String name = 'IconEditorRoute';
}

class IconEditorRouteArgs {
  const IconEditorRouteArgs({this.key, required this.initIcon});

  final _i15.Key? key;

  final _i17.SPIcon initIcon;

  @override
  String toString() {
    return 'IconEditorRouteArgs{key: $key, initIcon: $initIcon}';
  }
}

/// generated route for
/// [_i12.ColorPickerView]
class ColorPickerRoute extends _i14.PageRouteInfo<ColorPickerRouteArgs> {
  ColorPickerRoute({_i15.Key? key, required _i15.Color initColor})
      : super(ColorPickerRoute.name,
            path: '/color-picker-view',
            args: ColorPickerRouteArgs(key: key, initColor: initColor));

  static const String name = 'ColorPickerRoute';
}

class ColorPickerRouteArgs {
  const ColorPickerRouteArgs({this.key, required this.initColor});

  final _i15.Key? key;

  final _i15.Color initColor;

  @override
  String toString() {
    return 'ColorPickerRouteArgs{key: $key, initColor: $initColor}';
  }
}

/// generated route for
/// [_i13.KeypairsListView]
class KeypairsListRoute extends _i14.PageRouteInfo<void> {
  const KeypairsListRoute()
      : super(KeypairsListRoute.name, path: '/keypairs-list-view');

  static const String name = 'KeypairsListRoute';
}
