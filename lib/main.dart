import 'package:flutter/material.dart';
import './step_form.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Step App',
      home: StepForm(),
      
    );
  }
}
