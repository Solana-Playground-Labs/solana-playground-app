/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:solana_playground_language/lib.dart';

class PackageTemplate extends Equatable {
  final Package package;

  const PackageTemplate({
    required this.package,
  });

  @override
  List<Object?> get props => [package];
}
