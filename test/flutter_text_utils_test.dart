import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_text_utils/flutter_text_utils.dart';

void main() {
  test('capitalize works', () {
    expect("string".capitalize(), "String");
  });

  test('spacedUppercase works', () {
    expect("string".spacedUppercase(), "S T R I N G");
  });

  test('isEmail works', () {
    expect("test@mail.com".isEmail(), true);
    expect("notAnEmail".isEmail(), false);
  });

  test('isStrongPassword works', () {
    expect("Pass@123".isStrongPassword(), true);
    expect("weak".isStrongPassword(), false);
  });

  test('mask works', () {
    expect("string".mask(), "st**ng");
  });

  test('reverse works', () {
    expect("flutter".reverse(), "rettulf");
  });
}
