import 'default_env.dart';

class Configurations {
  static String _environment = DefaultConfig.environment;
  static String _baseUrl = DefaultConfig.baseUrl;
  static String _name = DefaultConfig.name;

  void setConfigurationValues(Map<String, dynamic> value) {
    _name = value['name'] ?? DefaultConfig.environment;
    _environment = value['environment'] ?? DefaultConfig.environment;
    _baseUrl = value['baseUrl'] ?? DefaultConfig.baseUrl;
  }

  static String get environment => _environment;
  static String get baseUrl => _baseUrl;
  static String get name => _name;
}
