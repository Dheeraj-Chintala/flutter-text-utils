<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f9d58,100:4285F4&height=200&section=header&text=Text%20Transformation%20And%20%20Validation%20Toolkit&fontSize=30&fontColor=ffffff" />
</p>

A lightweight  package with handy string utilities like `capitalize`, `mask`, `reverse`, email & password validation, **text analysis**, **case conversions**, **Base64 encoding/decoding**, and more.  
This package is great for quickly handling common string transformations, validations, and lightweight utilities.  

---

 

####  Basic Utilities  
| Method                | Example Input     | Output       |
|-----------------------|------------------|--------------|
| `.capitalize()`       | `"string"`       | `"String"`   |
| `.spacedUppercase()`  | `"string"`       | `"S T R I N G"` |
| `.reverse()`          | `"flutter"`      | `"rettulf"`  |
| `.mask()`             | `"9969696969"`   | `"99******69"` |
| `.isEmail()`          | `"test@mail.com"`| `true`       |
| `.isStrongPassword()` | `"Pass@123"`     | `true`       |


####  Text Analysis  

| Property              | Example Input                   | Output |
|-----------------------|---------------------------------|--------|
| `.wordCount`          | `"Hello world"`                 | `2`    |
| `.charCount()`        | `"Hello world"`                 | `11`   |
| `.charCount(excludeSpaces: true)` | `"Hello world"`     | `10`   |
| `.sentenceCount`      | `"Hello world! How are you?"`   | `2`    | 

####  Case Conversion  
- `.toCamelCase` → `"hello world"` → `"helloWorld"`  
- `.toSnakeCase` → `"hello world"` → `"hello_world"`  
- `.toKebabCase` → `"hello world"` → `"hello-world"`  
- `.toPascalCase` → `"hello world"` → `"HelloWorld"`  

####  Password Validation  
| Property                  | Example Input   | Output        |
|---------------------------|-----------------|---------------|
| `.passwordStrength`       | `"Pass123!"`    | `3`           |
| `.passwordStrengthLabel`  | `"Pass123!"`    | `Very Strong` | 

####  Encoding & Utilities  
| Method / Utility              | Example Input  | Output        |
|-------------------------------|----------------|---------------|
| `.encodeBase64`               | `"hello"`      | `aGVsbG8=`    |
| `.decodeBase64`               | `"aGVsbG8="`   | `hello`       |
| `.stringToNum`                | `"123"`        | `123`         |
| `FlutterTextUtils.generateShortId([length])` | – | Random short ID |

---

###  Getting started  

Add this package to your `pubspec.yaml`:  

```yaml
dependencies:
  flutter_text_utils: <latest-version>
```

Then run
```bash
flutter pub get
```
OR
```bash
flutter pub add flutter_text_utlis
```
Import it into your Dart/Flutter project:
```bash
import 'package:flutter_text_utils/flutter_text_utils.dart';
```
Usage
```dart
void main() {
  print("string".capitalize());         // String
  print("string".spacedUppercase());    // S T R I N G
  print("test@mail.com".isEmail());     // true
  print("Pass@123".isStrongPassword()); // true
  print("9969696969".mask());           // 99******69
  print("flutter".reverse());           // rettulf

  // Text analysis
  print("Hello world".wordCount);                      // 2
  print("Hello world".charCount());                    // 11
  print("Hello world".charCount(excludeSpaces: true)); // 10
  print("Hello world! How are you?".sentenceCount);    // 2

  // Case conversion
  print("hello world".toCamelCase);  // helloWorld
  print("hello world".toSnakeCase);  // hello_world
  print("hello world".toKebabCase);  // hello-world
  print("hello world".toPascalCase); // HelloWorld

  // Password strength
  print("Pass123!".passwordStrengthLabel); // Very Strong

  // Encoding & utilities
  print("hello".encodeBase64);               // aGVsbG8=
  print("aGVsbG8=".decodeBase64);            // hello
  print("123".stringToNum);                  // 123
  print(FlutterTextUtils.generateShortId()); // Random short ID
}
```
### 🤝 Contributing
I’m actively looking for contributions to make this package more useful!

- Got an idea for a new string utility?

- Found a bug?

- Want to improve documentation or examples?

Please open an [issue](https://github.com/Dheeraj-Chintala/flutter-text-utils/issues/new) or submit a pull request on [GitHub](https://github.com/Dheeraj-Chintala/flutter-text-utils)

### License
This project is licensed under [MIT LICENSE](LICENSE) 
