import 'package:flutter/services.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class CapitalizeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue _,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (text.isNotEmpty) {
      text = text.lowerCaseCapitalize;
    }
    return TextEditingValue(
      text: text,
      selection: newValue.selection,
    );
  }
}
