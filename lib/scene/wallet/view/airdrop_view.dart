import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/common/card.dart';
import 'package:solana_playground_app/repository/wallet_repository.dart';
import 'package:solana_playground_app/scene/home/cubit/airdrop_cubit.dart';
import 'package:solana_playground_app/scene/home/widget/key_widget.dart';

class AirdropView extends StatelessWidget {
  final Wallet wallet;

  const AirdropView({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AirdropCubit>(
      create: (context) => AirdropCubit(context.read(), wallet),
      child: Builder(builder: (context) {
        return content(context);
      }),
    );
  }

  Widget content(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airdrop"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              FutureBuilder<String>(
                future: wallet.address,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return SPCard(
                    child: KeyWidget(text: snapshot.data ?? ""),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: context.read<AirdropCubit>().amountInput,
                keyboardType: TextInputType.number,
                maxLines: 1,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(hintText: "Amount"),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  context.read<AirdropCubit>().submit().then((value) {
                    context.router.pop();
                  }).onError((error, stackTrace) {
                    final snackBar = SnackBar(content: Text(error.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<AirdropCubit, AirdropState>(
                        builder: (context, state) {
                      return state.isFetching
                          ? Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 14,
                              height: 14,
                              child: const CircularProgressIndicator(
                                strokeWidth: 1.2,
                              ))
                          : Container();
                    }),
                    const Text("Confirm"),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}