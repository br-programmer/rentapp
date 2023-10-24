class DartDefine {
  const DartDefine._();
  static const baseUrl = String.fromEnvironment('baseUrl');
  static const enableLogging = bool.fromEnvironment('enableLogging');
  static const flavorName = String.fromEnvironment('flavorName');
}
