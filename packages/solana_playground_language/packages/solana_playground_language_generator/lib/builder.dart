library solana_playground_language_generator.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/command_buildable/command_builder_generator.dart';
import 'src/value_buildable/value_builder_generator.dart';

Builder valueBuilder(BuilderOptions options) => PartBuilder(
      [
        ValueBuilderGenerator(),
        CommandBuilderGenerator(),
      ],
      ".builder.dart",
    );
