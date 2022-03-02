import 'package:observable/observable.dart';
import 'package:solana_playground_language/src/core/command/command.dart';

import '../builder.dart';

abstract class CommandBuilder extends Builder {
  Command build();

  @override
  CommandBuilder clone();
}
