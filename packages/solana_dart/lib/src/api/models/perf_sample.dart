/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

class PerfSample {
  const PerfSample({
    required this.numSlots,
    required this.numTransactions,
    required this.samplePeriodSecs,
    required this.slot,
  });

  final int numSlots;
  final int numTransactions;
  final int samplePeriodSecs;
  final int slot;

  @override
  List<Object> get props => [
        numSlots,
        numTransactions,
        samplePeriodSecs,
        slot,
      ];

  Map<String, dynamic> toMap() {
    return {
      'numSlots': numSlots,
      'numTransactions': numTransactions,
      'samplePeriodSecs': samplePeriodSecs,
      'slot': slot,
    };
  }

  static List<PerfSample> fromArray(List<dynamic> array) {
    return array.map(PerfSample.fromMap).toList();
  }

  factory PerfSample.fromMap(dynamic map) {
    return PerfSample(
      numSlots: map['numSlots'] as int,
      numTransactions: map['numTransactions'] as int,
      samplePeriodSecs: map['samplePeriodSecs'] as int,
      slot: map['slot'] as int,
    );
  }
}
