/*
 *  Solana Playground  Copyright (C) 2022  Tran Giang Long
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solana_playground_app/model/package_template.dart';
import 'package:solana_playground_app/repository/package_repository.dart';

class CreatePackageView extends StatefulWidget {
  final PackageTemplate? template;

  const CreatePackageView({Key? key, this.template}) : super(key: key);

  @override
  State<CreatePackageView> createState() => _CreatePackageViewState();
}

class _CreatePackageViewState extends State<CreatePackageView> {
  final packageNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    packageNameController.text = widget.template?.package.name ?? "";
    super.initState();
  }

  @override
  void dispose() {
    packageNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: widget.template == null ? const Text("Create package") : const Text("Create package from template"),
          actions: [
            IconButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (widget.template == null) {
                    context
                        .read<PackageRepository>()
                        .createPackage(packageNameController.text);
                  } else {
                    final packageBuilder = widget.template!.package.asBuilder();
                    packageBuilder.name = packageNameController.text;

                    context
                        .read<PackageRepository>()
                        .addPackage(packageBuilder.build());
                  }
                  context.router.pop();
                }
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: packageNameController,
                validator: (value) {
                  if (value == null) {
                    return "Package is empty";
                  }
                  if (context.read<PackageRepository>().contain(value)) {
                    return "Package is already exists";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Package name"),
              ),
              const SizedBox(height: 8),
              const Text("Configuration:"),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Checkbox(value: true, onChanged: null),
                  Text("Application")
                ],
              ),
              Row(
                children: const [
                  Checkbox(value: false, onChanged: null),
                  Text("Package")
                ],
              ),
              if (widget.template != null) ... [
                const SizedBox(height: 8),
                Text("Template: ${widget.template!.package.name}"),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
