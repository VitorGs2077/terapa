import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/cadastro.dart';
import 'package:terapa/cadastroTerapeuta.dart';
import 'package:terapa/login.dart';
import 'package:terapa/perfil.dart';
import 'package:terapa/pesquisa.dart';
import 'package:terapa/terapeuta.dart';
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
      home: TelaLogin(),
    );
  }
}