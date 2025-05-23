import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/login.dart';
// Tom azul: (158, 19, 130, 155)
// Tom verde: (237, 108, 171, 124)

class Pesquisa extends StatelessWidget {
  const Pesquisa({super.key});

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
class TelaPesquisa extends StatefulWidget {
  const TelaPesquisa({super.key});

  @override
  State<TelaPesquisa> createState() => _TelaPesquisaState();
}
class _TelaPesquisaState extends State<TelaPesquisa> {
  get icon => null;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Directory>(
      future: getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Erro ao acessar diretório"));
        } else if (snapshot.hasData) {
          final directory = snapshot.data!;
          final nomePath = '${directory.path}/nome.txt';
          final file = File(nomePath);

          return FutureBuilder<String>(
          future: file.readAsString(),
          builder: (context, nomeSnapshot) {
            if (nomeSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (nomeSnapshot.hasError || !nomeSnapshot.hasData) {
              print(nomeSnapshot.error);
              return const Center(child: Text("Erro ao ler nome do usuário"));
            } else if (nomeSnapshot.hasData) {
              final nomeUsuario = nomeSnapshot.data!;
              return Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(158, 19, 130, 155),
                      Color.fromARGB(237, 108, 171, 124),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisa',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            bottomNavigationBar: bottomUserBar(context, nomeUsuario)
            );
                  }
                  return const Center(child: Text("Erro desconhecido"));
        });
                  }
                  return const Center(child: Text("Erro desconhecido"));
              },
            );
          }
        }