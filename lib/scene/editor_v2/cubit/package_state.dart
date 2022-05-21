/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'package_cubit.dart';

class PackageNameState extends Equatable {
  final String name;

  const PackageNameState({required this.name});

  @override
  List<Object> get props => [name];

  PackageNameState copyWith({
    String? name,
  }) {
    return PackageNameState(
      name: name ?? this.name,
    );
  }
}
