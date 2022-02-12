import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/widget/solana_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solana_playground_app/scene/home/widget/solana_cookbook-card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('SOLANA', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        actions: [
          SvgPicture.asset('assets/icons/user.svg'),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Text("@darklong97x"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 35,
            children: [
              SolanaCard(),
              const SolanaCookBookCard(),
            ],
          ),
          ElevatedButton(
            child: const Text("Editor"),
            onPressed: () {
              context.router.navigate(const EditorRoute());
            },
          ),
        ],
      ),
    );
  }
}
