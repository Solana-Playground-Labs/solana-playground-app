import 'abstract_command.dart';

class RequestRecentBlockhash extends Command {
  final String variable;

  const RequestRecentBlockhash({required this.variable});

  @override
  List<Object> get props => [variable];
}
