/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solana_playground_app/common/transition/overlay.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart';
import 'package:solana_playground_app/scene/editor_v2/view/color_picker_view.dart';
import 'package:solana_playground_app/scene/editor_v2/view/editor_view.dart';
import 'package:solana_playground_app/scene/editor_v2/view/icon_editor_view.dart';
import 'package:solana_playground_app/scene/editor_v2/view/keypairs_list_view.dart';
import 'package:solana_playground_app/scene/home/view/home_view.dart';
import 'package:solana_playground_app/scene/wallet/view/airdrop_view.dart';
import 'package:solana_playground_app/scene/wallet/view/create_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/import_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/wallet_detail_view.dart';
import 'package:solana_playground_language/solana_playground_language.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: CreateWalletView),
    AutoRoute(page: ImportWalletView),
    AutoRoute(page: WalletDetailView),
    AutoRoute(page: AirdropView),
    AutoRoute(page: EditorView),
    CustomRoute(page: ExpressionInspectorView, customRouteBuilder: popover),
    CustomRoute<SPIcon>(page: IconEditorView, customRouteBuilder: popover),
    CustomRoute<Color>(page: ColorPickerView, customRouteBuilder: popover),
    CustomRoute(page: KeypairsListView, customRouteBuilder: popover),
  ],
)
class $AppRouter {}
