import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:taskly/pages/home_page.dart';

void main() async {
  await Hive.initFlutter("hive_boxes");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
      ),
      home: HomePage()
    );
  }
}