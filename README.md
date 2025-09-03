# flutter_text_utils

A lightweight Flutter/Dart package with handy string utilities like `capitalize`, `mask`, `reverse`, email & password validation, and more.  
This package is great for quickly handling common string transformations and form validations.

---

## ✨ Features

- `.capitalize()` → `"string"` → `"String"`
- `.spacedUppercase()` → `"string"` → `"S T R I N G"`
- `.isEmail()` → validates if a string is a valid email
- `.isStrongPassword()` → checks if a string meets strong password rules *(≥8 chars, upper, lower, number, special char)*
- `.mask()` → masks sensitive data  
  e.g., `"string"` → `"st**ng"`
- `.reverse()` → reverses a string  
  e.g., `"flutter"` → `"rettulf"`

---

## 🚀 Getting started

Add this package to your `pubspec.yaml`:


```yaml
 dependencies:
   flutter_text_utils: ^0.0.1
```

then run:
```bash
 flutter pub get
```
OR

```bash
 flutter pub add flutter_text_utils
```
 Import it into your Dart/Flutter project:
```bash
import 'package:flutter_text_utils/flutter_text_utils.dart';
```

Usage 
```dart
void main() {
  print("string".capitalize());        // String
  print("string".spacedUppercase());   // S T R I N G
  print("test@mail.com".isEmail());    // true
  print("Pass@123".isStrongPassword()); // true
  print("string".mask());              // st**ng
  print("flutter".reverse());          // rettulf
}
```


Additional information

- Issues & Feedback → Please file issues on the GitHub issue tracker.

- Contributions → Pull requests are welcome!

- License → This project is licensed under the MIT License.


