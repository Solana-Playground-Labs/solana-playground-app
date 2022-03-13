import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/scene/editor/view/editor_view.dart';
import 'package:solana_playground_app/scene/home/view/home_view.dart';
import 'package:solana_playground_app/scene/wallet/view/airdrop_view.dart';
import 'package:solana_playground_app/scene/wallet/view/create_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/import_wallet_view.dart';
import 'package:solana_playground_app/scene/wallet/view/wallet_detail_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: CreateWalletView),
    AutoRoute(page: ImportWalletView),
    AutoRoute(page: WalletDetailView),
    AutoRoute(page: AirdropView),
    AutoRoute(page: EditorView),
  ],
)
class $AppRouter {}
