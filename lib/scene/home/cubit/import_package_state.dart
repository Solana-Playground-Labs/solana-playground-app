// Solana Playground
// Copyright (C) 2022 Tran Giang Long
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

part of 'import_package_cubit.dart';

class ImportPackageState extends Equatable {
  final Exception? exception;
  final bool isProcessing;

  const ImportPackageState({this.exception, this.isProcessing = false});

  @override
  List<Object?> get props => [exception, isProcessing];

  ImportPackageState copyWith({
    Exception? exception,
    bool? isProcessing,
  }) {
    return ImportPackageState(
      exception: exception ?? this.exception,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}
