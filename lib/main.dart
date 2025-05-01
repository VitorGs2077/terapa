import 'package:flutter/material.dart';
import 'package:terapa/home.dart';
// Tom azul: (158, 19, 130, 155)
// Tom verde: (237, 108, 171, 124)

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: MyHomePage(),
    );
  }
}