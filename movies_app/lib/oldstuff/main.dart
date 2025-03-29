import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnyScreen(),
    );
  }
}

class AnyScreen extends StatefulWidget {
  const AnyScreen({
    super.key,
  });

  @override
  State<AnyScreen> createState() => _AnyScreenState();
}

class _AnyScreenState extends State<AnyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
