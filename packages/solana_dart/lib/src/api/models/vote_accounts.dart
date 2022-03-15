/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';

class VoteAccounts extends Equatable {
  const VoteAccounts({
    required this.current,
    required this.delinquent,
  });

  final List<EpochCredit> current;
  final List<EpochCredit> delinquent;

  @override
  List<Object> get props => [current, delinquent];

  Map<String, dynamic> toMap() {
    return {
      'current': current,
      'delinquent': delinquent,
    };
  }

  factory VoteAccounts.fromMap(dynamic map) {
    return VoteAccounts(
      current: List.from(map["current"].map((x) => EpochCredit.fromMap(x))),
      delinquent: List.from(map["delinquent"].map((x) => EpochCredit.fromMap(x))),
    );
  }
}

class EpochCredit extends Equatable {
  const EpochCredit({
    required this.commission,
    required this.epochVoteAccount,
    required this.epochCredits,
    required this.nodePubkey,
    required this.lastVote,
    required this.activatedStake,
    required this.votePubkey,
  });

  final int commission;
  final bool epochVoteAccount;
  final List<List<int>> epochCredits;
  final String nodePubkey;
  final int lastVote;
  final int activatedStake;
  final String votePubkey;

  @override
  List<Object> get props => [
        commission,
        epochVoteAccount,
        epochCredits,
        nodePubkey,
        lastVote,
        activatedStake,
        votePubkey,
      ];

  Map<String, dynamic> toMap() {
    return {
      'commission': commission,
      'epochVoteAccount': epochVoteAccount,
      'epochCredits': epochCredits,
      'nodePubkey': nodePubkey,
      'lastVote': lastVote,
      'activatedStake': activatedStake,
      'votePubkey': votePubkey,
    };
  }

  factory EpochCredit.fromMap(dynamic map) {
    return EpochCredit(
      commission: map['commission'] as int,
      epochVoteAccount: map['epochVoteAccount'] as bool,
      epochCredits: List.castFrom(map['epochCredits']),
      nodePubkey: map['nodePubkey'] as String,
      lastVote: map['lastVote'] as int,
      activatedStake: map['activatedStake'] as int,
      votePubkey: map['votePubkey'] as String,
    );
  }
}
