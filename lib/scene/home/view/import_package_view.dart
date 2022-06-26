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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/library/cubit_widget.dart';
import 'package:solana_playground_app/scene/home/cubit/import_package_cubit.dart';

class ImportPackageView extends CubitWidget<ImportPackageCubit, ImportPackageState> {
  const ImportPackageView({Key? key}) : super(key: key);

  @override
  Widget content(BuildContext context, ImportPackageState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Import package"),
        actions: [
          IconButton(
            onPressed: state.isProcessing
                ? null
                : () async {
                    await context.read<ImportPackageCubit>().import();
                    context.router.pop();
                  },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          if (state.exception != null) Text(state.exception!.toString()),
          Expanded(
            child: TextField(
              controller: context.read<ImportPackageCubit>().input,
              minLines: 1,
              maxLines: null,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none,
                hintText: "Source",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ImportPackageCubit? cubit(BuildContext context) => ImportPackageCubit(context.read());
}
