import 'package:sentry_flutter/sentry_flutter.dart';

import 'core_log.dart';

class SentryLog implements CoreLog {
  @override
  void log({
    required String message,
    Exception? exception,
    StackTrace? stacktrace,
  }) {
    Sentry.captureException(
      exception,
      hint: message,
      stackTrace: stacktrace,
    );
  }
}
