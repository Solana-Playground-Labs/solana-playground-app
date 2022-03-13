import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/home/cubit/wallets_cubit.dart';

class WalletsSection extends StatelessWidget {
  const WalletsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletsCubit>(
      create: (context) => WalletsCubit(context.read()),
      child: BlocBuilder<WalletsCubit, WalletsState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: state.wallets.length + 1,
            itemBuilder: (context, index) {
              Widget child;

              if (index < state.wallets.length) {
                final wallet = state.wallets[index];
                child = Text(wallet.name);
              } else {
                child = InkWell(
                  onTap: () {},
                  child: DottedBorder(
                    strokeWidth: 1,
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    dashPattern: const [6, 2],
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Create new wallet"),
                      ),
                    ),
                  ),
                );
              }

              return SizedBox(
                width: 140,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
