/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/component/network/network_label.dart';
import 'package:solana_playground_app/route/app_router.gr.dart';
import 'package:solana_playground_app/scene/home/cubit/packages_cubit.dart';
import 'package:solana_playground_app/scene/home/widget/home_header_widget.dart';
import 'package:solana_playground_app/scene/home/widget/package_templates_section.dart';
import 'package:solana_playground_app/scene/home/widget/packages_section.dart';
import 'package:solana_playground_app/scene/home/widget/solana_card.dart';
import 'package:solana_playground_app/scene/home/widget/solana_cookbook_card.dart';
import 'package:solana_playground_app/scene/home/widget/keypairs_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<PackagesCubit>(
      create: (context) => PackagesCubit(context.read()),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: const Text('Solana Playground'),
          centerTitle: false,
          actions: const [
            Center(child: NetworkLabel()),
            SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const HomeHeaderWidget(header: Text("🏠 Home")),
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
                        HomeCard(
                          title: 'ℹ️ Info',
                          description: 'Welcome to Solana Playground',
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    child: const Text("Discord"),
                                    onPressed: () {
                                      launchUrl(
                                        Uri.parse("https://discord.gg/9q8UT5QwwA"),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        HomeCard(
                          title: '📕 Solana documentation',
                          description:
                              'A manual for joining the Solana ecosystem. By builders for builders.',
                          color: Colors.blue.shade200,
                          onTap: () {
                            launchUrl(
                              Uri.parse("https://docs.solana.com"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        HomeCard(
                          title: '📚 Solana cookbook',
                          description:
                              'Developer resource that provides the essential concepts and recipes for building applications on Solana.',
                          color: Colors.deepOrange.shade300,
                          onTap: () {
                            launchUrl(
                              Uri.parse("https://solanacookbook.com"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        HomeCard(
                          title: '👥 Open source application',
                          description: 'Help us to improve this amazing app for community 🚀',
                          color: Colors.green.shade200,
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                  "https://github.com/Solana-Playground-Labs/solana-playground-app"),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const HomeHeaderWidget(header: Text("🔑 Key pairs")),
              const SizedBox(height: 140, child: KeypairsSection()),
              const HomeHeaderWidget(header: Text("🧑‍💻👩‍💻 Projects")),
              const SizedBox(height: 16),
              const PackagesSection(),
              const SizedBox(height: 16),
              const HomeHeaderWidget(header: Text("📃 Templates")),
              const SizedBox(height: 16),
              const PackageTemplatesSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
