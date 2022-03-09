part of 'binary_value_builder_cubit.dart';

class BinaryValueBuilderState extends Equatable {
  final int? cursorPosition;
  final Uint8List data;

  const BinaryValueBuilderState({
    required this.data,
    this.cursorPosition,
  });

  @override
  List<Object?> get props => [data, cursorPosition];

  BinaryValueBuilderState clearCursorPosition() => copyWith(data: data);

  BinaryValueBuilderState copyWith({
    int? cursorPosition,
    Uint8List? data,
  }) {
    return BinaryValueBuilderState(
      cursorPosition: cursorPosition ?? this.cursorPosition,
      data: data ?? this.data,
    );
  }
}
