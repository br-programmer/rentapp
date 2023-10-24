import 'dart:convert';

extension StringX on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  String get lowerCaseCapitalize => toLowerCase().capitalize;
  Map<String, dynamic> get decode => jsonDecode(this) as Map<String, dynamic>;
  // String get hardcode => this;
}
