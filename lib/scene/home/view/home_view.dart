import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text("Editor"),
          onPressed: () {
            context.router.navigate(const EditorRoute());
          },
        ),
      ),
    );
  }
}
