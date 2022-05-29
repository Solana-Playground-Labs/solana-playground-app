library solana_playground_language_generator.builder;

import 'package:build/build.dart';
import 'package:solana_playground_language_generator/annotations.dart';
import 'package:solana_playground_language_generator/src/value_json_builder_generator.dart';
import 'package:source_gen/source_gen.dart';

import 'src/value_builder_generator.dart';

Builder valueBuilder(BuilderOptions options) => PartBuilder(
      [
        ValueBuilderGenerator(),
      ],
      ".builder.dart",
    );
