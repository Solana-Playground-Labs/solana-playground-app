import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/scene/editor/view/editor_view.dart';
import 'package:solana_playground_app/scene/home/view/home_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
    AutoRoute(page: EditorView),
  ],
)
class $AppRouter {}
