import 'dart:convert';
import 'dart:math';

extension FlutterTextUtils on String {
  /// Capitalizes the first letter of the string
  String capitalize() => isEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Returns the string with spaces between characters and in UPPERCASE
  String spacedUppercase() =>
      isEmpty ? this : split('').map((c) => c.toUpperCase()).join(' ');

  /// Validates if the string is a valid email
  bool isEmail() => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  /// Checks if the string is a strong password
  bool isStrongPassword() =>
      length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(this) &&
      RegExp(r'[a-z]').hasMatch(this) &&
      RegExp(r'[0-9]').hasMatch(this) &&
      RegExp(r'[!@#\$&*~]').hasMatch(this);

  /// Masks the string by replacing middle characters with '*'
  String mask({int visibleStart = 2, int visibleEnd = 2}) {
    if (isEmpty || length <= visibleStart + visibleEnd) return this;
    return substring(0, visibleStart) +
        '*' * (length - visibleStart - visibleEnd) +
        substring(length - visibleEnd);
  }

  /// Reverses the string
  String reverse() => split('').reversed.join();

  //  <<<<<<<<<<<  TEXT ANALYSIS  >>>>>>>>>>>>>>>>>

  int get wordCount => trim().isEmpty ? 0 : trim().split(RegExp(r'\s+')).length;

  int charCount({bool excludeSpaces = false}) =>
      excludeSpaces ? replaceAll(' ', '').length : length;

  int get sentenceCount => trim().isEmpty
      ? 0
      : split(RegExp(r'[.!?]+')).where((s) => s.trim().isNotEmpty).length;

  //  <<<<<<<<<<<  CASE CONVERSION  >>>>>>>>>>>>>>>>>

  String get toCamelCase {
    final words = toLowerCase()
        .split(RegExp(r'[\s_-]+'))
        .where((w) => w.isNotEmpty)
        .toList();
    if (words.isEmpty) return '';
    return words.first +
        words.skip(1).map((w) => w[0].toUpperCase() + w.substring(1)).join();
  }

  String get toSnakeCase => trim().isEmpty
      ? ''
      : trim().toLowerCase().replaceAll(RegExp(r'[\s-]+'), '_');

  String get toKebabCase => trim().isEmpty
      ? ''
      : trim().toLowerCase().replaceAll(RegExp(r'[\s_]+'), '-');

  String get toPascalCase {
    final words = toLowerCase()
        .split(RegExp(r'[\s_-]+'))
        .where((w) => w.isNotEmpty);
    return words.map((w) => w[0].toUpperCase() + w.substring(1)).join();
  }

  //  <<<<<<<<<<<  PASSWORD VALIDATION  >>>>>>>>>>>>>>>>>

  int get passwordStrength {
    if (isEmpty) return 0;
    int score = 0;
    if (length < 8) return 0;
    if (RegExp(r'[A-Z]').hasMatch(this)) score++;
    if (RegExp(r'[a-z]').hasMatch(this)) score++;
    if (RegExp(r'[0-9]').hasMatch(this)) score++;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(this)) score++;

    if (score <= 1) return 0; // Weak
    if (score == 2) return 1; // Medium
    if (score == 3) return 2; // Strong
    return 3; // Very Strong
  }

  String get passwordStrengthLabel {
    switch (passwordStrength) {
      case 0:
        return "Weak";
      case 1:
        return "Medium";
      case 2:
        return "Strong";
      case 3:
        return "Very Strong";
      default:
        return "Unknown";
    }
  }

  //  <<<<<<<<<<<  ENCODING UTILITIES  >>>>>>>>>>>>>>>>>

  String get encodeBase64 => isEmpty ? '' : base64.encode(utf8.encode(this));

  String get decodeBase64 {
    try {
      return utf8.decode(base64.decode(this));
    } catch (_) {
      return '';
    }
  }

  num? get safeToNum => num.tryParse(this);


static String generateShortId([int length = 8]) {
  if (length <= 0) return '';
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final rand = Random.secure(); // better randomness
  return List.generate(
    length,
    (i) => chars[rand.nextInt(chars.length)],
  ).join();
}
}
