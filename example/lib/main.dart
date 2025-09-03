import 'package:flutter/material.dart';
import 'package:flutter_text_utils/flutter_text_utils.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("flutter_text_utils Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("string".capitalize()),        // String
              Text("string".spacedUppercase()),   // S T R I N G
              Text("test@mail.com".isEmail().toString()), // true
              Text("Pass@123".isStrongPassword().toString()), // true
              Text("9969696969".mask()),              // 99******69
              Text("flutter".reverse()),          // rettulf
            ],
          ),
        ),
      ),
    );
  }
}
