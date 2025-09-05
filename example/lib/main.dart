import 'package:flutter/material.dart';
import 'package:flutter_text_utils/flutter_text_utils.dart';

void main() {
  runApp(const FlutterTextUtilsExample());
}

class FlutterTextUtilsExample extends StatelessWidget {
  const FlutterTextUtilsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Text Utils Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Text Utils Example"),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: ExampleContent(),
        ),
      ),
    );
  }
}

class ExampleContent extends StatelessWidget {
  const ExampleContent({super.key});

  Widget buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget buildExample(String description, String result) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text("$description → $result"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSection("Basic Utilities", [
          buildExample('"string".capitalize()', "string".capitalize()),
          buildExample('"string".spacedUppercase()', "string".spacedUppercase()),
          buildExample('"test@mail.com".isEmail()', "test@mail.com".isEmail().toString()),
          buildExample('"Pass@123".isStrongPassword()', "Pass@123".isStrongPassword().toString()),
          buildExample('"9969696969".mask()', "9969696969".mask()),
          buildExample('"flutter".reverse()', "flutter".reverse()),
        ]),

        buildSection("Text Analysis", [
          buildExample('"Hello world".wordCount', "Hello world".wordCount.toString()),
          buildExample('"Hello world".charCount()', "Hello world".charCount().toString()),
          buildExample('"Hello world".charCount(excludeSpaces: true)', "Hello world".charCount(excludeSpaces: true).toString()),
          buildExample('"Hello world! How are you?".sentenceCount', "Hello world! How are you?".sentenceCount.toString()),
        ]),

        buildSection("Case Conversion", [
          buildExample('"hello world".toCamelCase', "hello world".toCamelCase),
          buildExample('"hello world".toSnakeCase', "hello world".toSnakeCase),
          buildExample('"hello world".toKebabCase', "hello world".toKebabCase),
          buildExample('"hello world".toPascalCase', "hello world".toPascalCase),
        ]),

        buildSection("Password Strength", [
          buildExample('"pass".passwordStrengthLabel', "".passwordStrengthLabel),
          buildExample('"Password".passwordStrengthLabel', "Password".passwordStrengthLabel),
          buildExample('"Pass123".passwordStrengthLabel', "Pass123".passwordStrengthLabel),
          buildExample('"Pass123!".passwordStrengthLabel', "Pass123!".passwordStrengthLabel),
        ]),

        buildSection("Encoding & Utilities", [
          buildExample('"hello".encodeBase64', "hello".encodeBase64),
          buildExample('"aGVsbG8=".decodeBase64', "aGVsbG8=".decodeBase64),
          buildExample('"123".stringToNum', "123".safeToNum.toString()),
          buildExample('FlutterTextUtils.generateShortId()', FlutterTextUtils.generateShortId()),
        ]),
      ],
    );
  }
}
