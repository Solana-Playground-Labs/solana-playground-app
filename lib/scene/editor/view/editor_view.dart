import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/editor/editor.dart';
import 'package:solana_playground_app/scene/editor/widget/bottom_toolbar.dart';
import 'package:solana_playground_app/scene/home/cubit/wallets_cubit.dart';
import 'package:solana_playground_app/theme/editor_theme.dart';
import 'package:solana_playground_language/solana_playground_language.dart'
    hide Builder;

import '../widget/status_bar.dart';

class EditorView extends StatelessWidget {
  final packageBuilder = SPPackageBuilder(
    packageType: PackageType.application,
    functionBuilders: [
      ScriptBuilder(
          name: "main",
          blockCommandBuilder: BlockCommandBuilder(
            commands: ListBuilder.empty(),
          ))
    ],
  );

  EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return EditorTheme(
      themeData: EditorThemeData(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => RuntimeCubit(
                    packageBuilder,
                    context.read(),
                  )),
          BlocProvider(create: (context) => CodeEditorCubit(packageBuilder)),
        ],
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const StatusBar(),
              centerTitle: true,
              backgroundColor: EditorTheme.of(context).appBarColor,
              actions: [
                PopupMenuButton<Wallet>(
                  child: const Icon(Icons.account_balance_wallet),
                  onSelected: (wallet) {
                    context.router.push(WalletDetailRoute(wallet: wallet));
                  },
                  itemBuilder: (BuildContext context) {
                    final repository = context.read<WalletRepository>();
                    return repository.data
                        .map(
                          (e) => PopupMenuItem<Wallet>(
                            value: e,
                            child: Row(
                              children: [
                                Text(e.name),
                                const Spacer(),
                                const Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        )
                        .toList();
                  },
                ),
                const SizedBox(width: 16),
                Center(
                  child: Text(
                    "Devnet",
                    style:
                        theme.textTheme.bodyText1?.copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      LeftPanel(),
                      Expanded(child: CodeEditorPanel()),
                      RightPanel(),
                    ],
                  ),
                ),
                const BottomToolBar(),
                const BottomPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
