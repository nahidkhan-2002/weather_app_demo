import 'firstpage.dart';
import 'secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
      routes: {
        'firstpage': (context) => const Firstpage(),
        'secondpage': (context) => const Secondpage(),
      },
    );
  }
}
