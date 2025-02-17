abstract class ILoggerModule {
  Future<void> init();
  void logCritical(
      {required final Object exception,
      required final StackTrace stackTrace});
  Future<void> logEvent(final Future<void> Function() eventCallback);
  void debugLog(final String content);
}
