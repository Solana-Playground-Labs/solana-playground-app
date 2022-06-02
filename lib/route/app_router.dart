/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/common/transition/overlay.dart';
import 'package:solana_playground_app/scene/editor_v2/solana_playground/tools/inspector/type_inspector.dart';
import 'package:solana_playground_app/scene/editor_v2/view/editor_view.dart';
import 'package:solana_playground_app/scene/home/view/home_view.dart';
import 'package:solana_playground_app/scene/wallet/view/airdrop_view.dart';
import 'package:solana_playground_app/scene/wallet/view/create_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/import_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/wallet_detail_view.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView),
    AutoRoute(page: CreateWalletView),
    AutoRoute(page: ImportWalletView),
    AutoRoute(page: WalletDetailView),
    AutoRoute(page: AirdropView),
    AutoRoute(page: EditorView, initial: true),
    CustomRoute(page: ExpressionInspectorView, customRouteBuilder: popover),
  ],
)
class $AppRouter {}
