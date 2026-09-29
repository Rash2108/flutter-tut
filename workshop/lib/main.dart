import 'package:flutter/material.dart';
import 'package:workshop/screens/hello_world.dart';
import 'package:workshop/screens/snackbar.dart';
import 'package:workshop/screens/textfield.dart';
import 'package:workshop/screens/form_controls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      home: const FormControlsProgram(),
    );
  }
}