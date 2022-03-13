import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/widget/home_header_widget.dart';
import 'package:solana_playground_app/scene/home/widget/solana_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/scene/home/widget/solana_cookbook_card.dart';
import 'package:solana_playground_app/scene/home/widget/wallets_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('SOLANA', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        actions: [
          SvgPicture.asset('assets/icon/user.svg'),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Text("@darklong97x"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeaderWidget(header: Text("Home")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 180,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SolanaCard(),
                      const SizedBox(width: 16),
                      const SolanaCookBookCard(),
                    ],
                  ),
                ),
              ),
            ),
            const HomeHeaderWidget(header: Text("Wallets")),
            const SizedBox(
              height: 120,
              child: WalletsSection(),
            ),
            ElevatedButton(
              child: const Text("Editor"),
              onPressed: () {
                context.router.navigate(const EditorRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
