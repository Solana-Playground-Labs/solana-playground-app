/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sp_icon.g.dart';

@JsonSerializable()
class SPIcon extends Equatable {
  final String shortName;
  final int backgroundColor;
  final int foregroundColor;

  const SPIcon({
    required this.shortName,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  factory SPIcon.empty() => const SPIcon(
        shortName: "EM",
        backgroundColor: 0xFFB0E0E6,
        foregroundColor: 0xFF000000,
      );

  @override
  List<Object> get props => [shortName, backgroundColor, foregroundColor];

  factory SPIcon.fromJson(Map<String, dynamic> json) => _$SPIconFromJson(json);

  Map<String, dynamic> toJson() => _$SPIconToJson(this);

  SPIcon copyWith({
    String? shortName,
    int? backgroundColor,
    int? foregroundColor,
  }) {
    return SPIcon(
      shortName: shortName ?? this.shortName,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }
}
