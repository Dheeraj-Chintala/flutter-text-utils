extension FlutterTextUtils on String {
  /// Capitalizes the first letter of the string
  String capitalize() =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Returns the string with spaces between characters and in UPPERCASE
  /// Example: "string".spacedUppercase() -> "S T R I N G"
  String spacedUppercase() =>
      split('').map((char) => char.toUpperCase()).join(' ');

  /// Validates if the string is a valid email
  bool isEmail() =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  /// Checks if the string is a strong password
  /// Conditions: at least 8 chars, upper, lower, digit, special char
  bool isStrongPassword() =>
      length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(this) &&
      RegExp(r'[a-z]').hasMatch(this) &&
      RegExp(r'[0-9]').hasMatch(this) &&
      RegExp(r'[!@#\$&*~]').hasMatch(this);

  /// Masks the string by replacing middle characters with '*'
  /// Example: "string".mask() -> "st**ng"
  String mask({int visibleStart = 2, int visibleEnd = 2}) {
    if (length <= visibleStart + visibleEnd) return this;
    return substring(0, visibleStart) +
        '*' * (length - visibleStart - visibleEnd) +
        substring(length - visibleEnd);
  }

  /// Reverses the string
  String reverse() => split('').reversed.join();
}
