import 'package:flutter/material.dart';
import 'package:wordle/wordle_theme.dart';

import 'core/presentation/home/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: WordleTheme.dark(),
    );
  }
}
