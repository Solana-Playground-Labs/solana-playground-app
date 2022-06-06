/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

part of 'package_cubit.dart';

class PackageNameState extends Equatable {
  final String name;
  final SPIcon icon;

  const PackageNameState({required this.name, required this.icon});

  @override
  List<Object> get props => [name, icon];

  PackageNameState copyWith({
    String? name,
    SPIcon? icon,
  }) {
    return PackageNameState(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }
}
