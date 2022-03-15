/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:flutter/material.dart';
import 'package:solana_playground_app/repository/solana_repository.dart';

class SolanaCard extends StatelessWidget {
  final SolanaRepository repository =
      SolanaRepository('https://api.mainnet-beta.solana.com');

  SolanaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: _InfoWidget<double>(
                future: repository.getTransactionPerSecond(),
                title: "Transactions per seconds",
                valueBuilder: (value) => value.toStringAsFixed(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: _InfoWidget<int>(
                future: repository.getTransactionCount(),
                title: "Total transactions",
                valueBuilder: (value) => value.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: _InfoWidget<double>(
                title: "Avg. cost per transactions",
                initialValue: 0.00025,
                valueBuilder: (value) => value.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: _InfoWidget<int>(
                future: repository.getValidatorNodesCount(),
                title: "Validator nodes",
                valueBuilder: (value) => value.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoWidget<T> extends StatelessWidget {
  final Future<T>? future;
  final T? initialValue;
  final String title;
  final String Function(T value) valueBuilder;

  const _InfoWidget({
    Key? key,
    this.future,
    required this.title,
    this.initialValue,
    required this.valueBuilder,
  }) : super(key: key);

  Future<T> _defaultValue() async => initialValue!;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.greenAccent.shade200),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                ),
                color: Colors.greenAccent.shade200,
              ),
              child: FutureBuilder<T>(
                future: future ?? _defaultValue(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.2,
                        ),
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      valueBuilder(snapshot.data!),
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
