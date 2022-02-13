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
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      width: 280,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Transactions per second',
                    style: TextStyle(color: Colors.greenAccent.shade200),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        color: Colors.greenAccent.shade200,
                      ),
                      height: 18,
                      width: 42,
                      child: Center(
                        child: FutureBuilder<double>(
                          future: repository.getTransactionPerSecond(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container();
                            }
                            return Text(
                                '${(snapshot.data ?? 0.0).toStringAsFixed(0)}',
                                style: TextStyle(color: Colors.black));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Total Transactions',
                    style: TextStyle(color: Colors.greenAccent.shade200),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        color: Colors.greenAccent.shade200,
                      ),
                      height: 18,
                      width: 100,
                      child: Center(
                        child: FutureBuilder<int>(
                          future: repository.getTransactionCount(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text('Loading');
                            }
                            return Text('${snapshot.data ?? 'no data'}',
                                style: TextStyle(color: Colors.black));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Avg. cost per transactions',
                      style: TextStyle(color: Colors.greenAccent.shade200)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(5.0),
                          ),
                          color: Colors.greenAccent.shade200,
                        ),
                        height: 18,
                        width: 62,
                        child: Center(
                            child: Text('0.00025',
                                style: TextStyle(color: Colors.black)))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Validator  nodes',
                      style: TextStyle(color: Colors.greenAccent.shade200)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        color: Colors.greenAccent.shade200,
                      ),
                      height: 18,
                      width: 42,
                      child: Center(
                        child: FutureBuilder<int>(
                          future: repository.getValidatorNodesCount(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Text('${snapshot.data ?? 'no data'}',
                                style: TextStyle(color: Colors.black));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
