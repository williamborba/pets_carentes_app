abstract class CoreLog {
  void log({
    required String message,
    Exception? exception,
    StackTrace? stacktrace,
  });
}
