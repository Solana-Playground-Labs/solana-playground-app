import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/scene/wallet/cubit/create_wallet_cubit.dart';

class CreateWalletView extends StatelessWidget {
  const CreateWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateWalletCubit>(
      create: (context) => CreateWalletCubit(context.read()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Create a new wallet"),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: context.read<CreateWalletCubit>().nameInput,
                    decoration: const InputDecoration(hintText: "Wallet name"),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text("Mnemonic:"),
                      IconButton(
                        onPressed: () {
                          context.read<CreateWalletCubit>().generate();
                        },
                        icon: const Icon(Icons.refresh),
                      )
                    ],
                  ),
                  BlocBuilder<CreateWalletCubit, CreateWalletState>(
                    builder: (context, state) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SPCard(
                        child: Text(state.mnemonic),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Derivation path:"),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller:
                              context.read<CreateWalletCubit>().accountInput,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration:
                              const InputDecoration(hintText: "Account"),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller:
                              context.read<CreateWalletCubit>().accountInput,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(hintText: "Change"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      context.read<CreateWalletCubit>().save().then((value) {
                        context.router.pop();
                      }).onError((error, stackTrace) {
                        final snackBar =
                            SnackBar(content: Text(error.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
