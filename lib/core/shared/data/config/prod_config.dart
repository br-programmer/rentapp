import 'package:rentapp/core/core.dart';

class ProdConfig implements IConfig {
  @override
  String get baseUrl => DartDefine.baseUrl;

  @override
  String get flavorName => DartDefine.flavorName;

  @override
  bool get enableLogging => DartDefine.enableLogging;
}
