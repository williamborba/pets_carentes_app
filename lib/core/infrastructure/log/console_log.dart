import 'package:logger/logger.dart' as logger;

import 'core_log.dart';

class ConsoleLog implements CoreLog {
  @override
  void log({
    required String message,
    Exception? exception,
    StackTrace? stacktrace,
  }) {
    final logger.Logger log = logger.Logger(
      level: logger.Level.debug,
      output: logger.ConsoleOutput(),
      printer: logger.PrettyPrinter(
          methodCount: 0, errorMethodCount: 8, lineLength: 120, colors: true, printEmojis: true, printTime: true),
    );

    if (exception != null || stacktrace != null) {
      log.e(message, exception, stacktrace);
    } else {
      log.d(message);
    }
  }
}
