import 'package:flutter/material.dart';
import 'package:simple_nickname_validation_implementation/main_controller.dart';
import 'package:simple_nickname_validation_implementation/main_screen.dart';
import 'package:simple_nickname_validation_implementation/src/responsive_layout_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Nickname Validation Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveLayoutBuilder(
        context,
        MainScreen(
          controller: MainController(),
        ),
      ),
    );
  }
}
