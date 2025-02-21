import 'package:flutter/services.dart';

class LineLimitInputFormatter extends TextInputFormatter {
  final int maxLines;

  LineLimitInputFormatter(this.maxLines);

  @override
  TextEditingValue formatEditUpdate(
      final TextEditingValue oldValue, final TextEditingValue newValue) {
    // Count the number of lines in the new text
    final int lineCount = '\n'.allMatches(newValue.text).length + 1;

    // If the number of lines exceeds the limit, revert to the old value
    if (lineCount > maxLines) {
      return oldValue;
    }

    return newValue;
  }
}
