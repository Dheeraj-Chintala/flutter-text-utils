import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_text_utils/flutter_text_utils.dart';

void main() {
  group('Basic String Utils', () {
    test('capitalize', () {
      expect("string".capitalize(), "String");
      expect("".capitalize(), "");
    });

    test('spacedUppercase', () {
      expect("abc".spacedUppercase(), "A B C");
      expect("".spacedUppercase(), "");
    });

    test('reverse', () {
      expect("flutter".reverse(), "rettulf");
      expect("a".reverse(), "a");
    });

    test('mask', () {
      expect("string".mask(), "st**ng");
      expect("hi".mask(), "hi"); // too short
    });
  });

  group('Validation', () {
    test('isEmail', () {
      expect("test@mail.com".isEmail(), true);
      expect("user@mail.co.uk".isEmail(), true);
      expect("notAnEmail".isEmail(), false);
    });

    test('isStrongPassword', () {
      expect("Pass@123".isStrongPassword(), true);
      expect("weak".isStrongPassword(), false);
      expect("12345678".isStrongPassword(), false);
    });
  });

  group('Text Analysis', () {
    test('wordCount', () {
      expect("hello world".wordCount, 2);
      expect("".wordCount, 0);
    });

    test('charCount', () {
      expect("abc def".charCount(), 7);
      expect("abc def".charCount(excludeSpaces: true), 6);
    });

    test('sentenceCount', () {
      expect("Hello. How are you?".sentenceCount, 2);
      expect("".sentenceCount, 0);
    });
  });

  group('Case Conversion', () {
    test('toCamelCase', () {
      expect("hello world".toCamelCase, "helloWorld");
      expect("".toCamelCase, "");
    });

    test('toSnakeCase', () {
      expect("Hello World".toSnakeCase, "hello_world");
      expect("".toSnakeCase, "");
    });

    test('toKebabCase', () {
      expect("Hello World".toKebabCase, "hello-world");
      expect("".toKebabCase, "");
    });

    test('toPascalCase', () {
      expect("hello world".toPascalCase, "HelloWorld");
      expect("".toPascalCase, "");
    });
  });

  group('Password Strength', () {
    test('passwordStrength & Label', () {
      expect("".passwordStrength, 0);
      expect("".passwordStrengthLabel, "Weak");
      expect("Password".passwordStrengthLabel, "Medium");
      expect("Pass123!".passwordStrengthLabel, "Very Strong");
    });
  });

  group('Encoding & Utilities', () {
    test('base64 encode/decode', () {
      const text = "hello";
      final encoded = text.encodeBase64;
      expect(encoded, "aGVsbG8=");
      expect(encoded.decodeBase64, text);

      // Invalid base64 should return empty string
      expect("%%%".decodeBase64, "");
    });

    test('safeToNum', () {
      expect("123".safeToNum, 123);
      expect("12.5".safeToNum, 12.5);
      expect("abc".safeToNum, null);
    });

    test('generateShortId', () {
      final id = FlutterTextUtils.generateShortId(10);
      expect(id.length, 10);
      expect(FlutterTextUtils.generateShortId(0), ""); // edge case
    });
  });
}
