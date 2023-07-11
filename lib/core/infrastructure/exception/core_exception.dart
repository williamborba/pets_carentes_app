import '../log/console_log.dart';
import '../log/sentry_log.dart';

abstract class CoreException implements Exception {
  CoreException({
    required String message,
    Exception? exception,
    StackTrace? stacktrace,
  }) : super() {
    ConsoleLog().log(
      message: message,
      exception: exception,
      stacktrace: stacktrace,
    );
    SentryLog().log(
      message: message,
      exception: exception,
      stacktrace: stacktrace,
    );
  }
}
